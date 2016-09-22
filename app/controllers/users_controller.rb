class UsersController < ApplicationController

  before_action :authorize, only: [:show]

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @status = Status.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path @user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path
  end

  # Only these fields are allowed on forms:
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :species, :photo, :age, :tagline)
  end
end
