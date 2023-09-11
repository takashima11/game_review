class Admin::PostsController < ApplicationController
  def show

    @post = Post.find(params[:id])
    @games = @post.game
    @comments = @post.comments
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_root_path
    # comment = Comment.find(params[:id])
    # comment.destroy
  end

end
