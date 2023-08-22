class Public::GamesController < ApplicationController
  GAME_GENRE_ID = 101205

  def search
    # if params[:keyword]
    #   # hoge = RakutenWebService::Ichiba::Item.ranking(:age => 30, :sex => 1)
    #   # root = RakutenWebService::Ichiba::Genre.root # ジャンルのルート
    #     # children はそのジャンルの直下のサブジャンルを返す
    #     # root.children.each do |child|
    #     #   byebug
    #     #   puts "[#{child.id}] #{child.name}"
    #     # end
    #   # @games = RakutenWebService::Games::Game.search(title: params[:keyword])
    #   RakutenWebService::Ichiba::Genre[101205].children.each do |child|
    #     byebug
    #     puts "[#{child.id}] #{child.name}"
    #   end
    # end
    if params[:keyword].present?
      @games_all = RakutenWebService::Books::Game.search(title: params[:keyword])

    elsif params[:hardware].present?
      @games_all = RakutenWebService::Books::Game.search(hardware: params[:hardware])
    else
      @games_all = []
    end

    @games_all = @games_all.map do |g|
      Game.new(title: g['title'],
               item_caption: g['itemCaption'],
               label: g['label'],
               jan: g['jan'],
               hardware: g['hardware'],
               item_url: g['item_url'],
               image_url: g['mediumImageUrl'].gsub('?_ex=120x120', ''),
               sales_date: g['sales_date'])
    end
  end

  def index
  end

  def show
    @game = Game.find_or_initialize_by(jan: game_params[:jan])
    if @game.new_record?
      @game.assign_attributes(game_params)
      @posts = []
    end
    @post = Post.new
    @posts = @game.posts
  end

  # def create
  #   post = Post.new(post_params)
  #   post.customer_id = current_customer.id
  #   post.game_id = game.id
  #   # post.save!
  #   # redirect_to posts_path
  #   @book.user_id = current_user.id
  #     if @post.save
  #       redirect_to post_path, notice: "You have created book successfully."
  #     else
  #       @posts = Posy.all
  #       render 'show'
  #     end
  # end

  private

  def game_params
    params.require(:game).permit(:title, :item_caption, :label, :jan, :hardware, :item_url, :image_url, :sales_date)
  end
end
