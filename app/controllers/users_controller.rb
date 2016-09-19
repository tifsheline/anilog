class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reidrect_to show_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # Only these fields are allowed on forms:
  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
