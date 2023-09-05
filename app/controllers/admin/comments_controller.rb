class Admin::CommentsController < ApplicationController

def destroy
  comment = Comment.find(params[:id])
  comment.destroy
  redirect_to admin_root_path
end

end
