class StatusesController < ApplicationController
  def create
    @status = Status.new(status_params)
    @status.user = current_user
    if @status.save
      redirect_to user_path @status.user
    end
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    @status.user = current_user
    if @status.save
      redirect_to user_path @status.user
    end
  end

  private
  def status_params
    params.require(:status).permit(:body)
  end
end
