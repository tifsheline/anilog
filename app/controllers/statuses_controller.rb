class StatusesController < ApplicationController
  def index
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
  end

  def create
    @status = Status.new(status_params)
    @status.user = current_user
    if @status.save
      redirect_to user_path @status.user
    end
  end

  def edit
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    @status.user = current_user
    if @status.save
      redirect_to user_path @status.user
    end
  end

  def destroy
  end

  private
  def status_params
    params.require(:status).permit(:body)
  end
end
