class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @game = Game.find_or_initialize_by(jan: game_params[:jan])
    if @game.new_record?
      @game.assign_attributes(game_params)
      @game.save!
    end
    @post = current_customer.posts.build(post_params.merge(game_id: @game.id))
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

    # @star = Post.where(star: "4")
    if params[:post].present? && params[:post][:star].present?

      @posts = Post.where(star: params[:post][:star]).order(created_at: :desc).page(params[:page]).per(8)

    else

      @posts = Post.order(created_at: :desc).page(params[:page]).per(8)
    end

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_customer.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:body, :star)
  end

  def game_params
    params.require(:post).permit(:title, :item_caption, :label, :jan, :hardware, :item_url, :image_url, :sales_date)
  end
end
