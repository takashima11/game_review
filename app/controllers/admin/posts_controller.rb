class Admin::PostsController < ApplicationController
  def show

    @games = Game.find(params[:game_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to 'admin_root_path'
    comment = Comment.find(params[:id])
    comment.destroy
  end

end
