class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(10)

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to admin_games_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    
    
    #@post = Post.find(params[:id])
    #@comments = @post.comments
    #@posts = Post.all
    @posts = @game.posts
    
    #@customers = Customer.all
  end

  def edit
    @games = Game.find(params[:id])
  end

  def update
    @games = Game.find(params[:id])
    @games.update(game_params)
    redirect_to admin_game_path(@games.id)

  end

  private

  def game_params
    params.require(:game).permit(:name, :introduction, :release_date, :image)
  end
end
