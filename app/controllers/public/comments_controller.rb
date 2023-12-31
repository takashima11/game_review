class Public::CommentsController < ApplicationController

  def create
    # @post = Post.find(params[:post_id])
    # @comment = Comment.new(comment_params)
    # @comment.customer_id = current_customer.id
    # @comment.post_id = @post.id
    # if @comment.save

    # else

    # end
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:c_comment, :comment_content, :post_id, :customer_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
