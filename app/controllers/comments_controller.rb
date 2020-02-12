class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id # or whatever is you session name
    if @comment.save
      redirect_to posts_path, notice: 'Comment was successfully created.'
    else
      redirect_to posts_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
