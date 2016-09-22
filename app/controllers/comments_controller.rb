class CommentsController < ApplicationController
  def create
    @comment = Status.find(params[:status_id]).comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to status_path @comment.status
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
