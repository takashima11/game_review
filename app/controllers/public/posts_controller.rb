class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  # before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  def new
    @post = Post.new
  end

  def create
    @game = Game.find_or_initialize_by(jan: game_params[:jan])
    if @game.new_record?
      @game.assign_attributes(game_params)
      @game.save!
    end
    @post = current_customer.posts.build(post_params.merge(game_id: @game.id, tag_ids:params[:post][:tag_ids].drop(1)))
    # binding.pry
    if @post.save
      flash[:notice] = "success"
      redirect_to posts_path
    else
      @posts = @game.posts
      flash.now[:alert] = "failed"
      render 'public/games/show'
    end
  end

  def index
    # @posts = Post.all
    # @customers = Customer.all

    # @star = Post.where(star: "4")。。「」
    # binding.pry


    if params[:post].present? && params[:post][:star].present?

      @posts = Post.where(star: params[:post][:star]).order(created_at: :desc).page(params[:page]).per(8)

    else

      @posts = Post.where(status: 0).order(created_at: :desc).page(params[:page]).per(8)

      # @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    end

    if params[:tag_id].present?
      # binding.pry
      @posts = Post.joins(:tags).where(tags: { id: params[:tag_id] }, status: 0)
    elsif params[:keyword]
      @posts = @posts.search(params[:keyword]).page(params[:page])
    else
      @posts = @posts.page(params[:page])
    end
    @keyword = params[:keyword]

  end

  def show
    # @posts = Post.published
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_customer.comments.new
  end

  def edit
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_customer.comments.new

    if @post.customer == current_customer
      render "edit"
    else
      redirect_to posts_path
    end

  end

  def update

    @post = Post.find(params[:id])
    @post.update(status: params[:post][:status])
    redirect_to edit_post_path(@post.id)
  end


  private

  def post_params
    params.require(:post).permit(:body, :star)
  end

  def game_params
    params.require(:post).permit(:title, :item_caption, :label, :jan, :hardware, :item_url, :image_url, :sales_date)
  end
end
