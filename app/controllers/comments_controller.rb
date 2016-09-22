class CommentsController < ApplicationController
  def create
    # @status = Status.find params[:status_id]
    @comment = Status.find(params[:status_id]).comments.new(comment_params)
    @comment.user = current_user
    # @comment = @status.comments.create(comment_params)
    # User.last.comments << @comments
    @comment.save
    redirect_to status_path @comment.status
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
