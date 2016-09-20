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
    @user = User.new({name: params[:user][:name], email: params[:user][:email], age: params[:user][:age], password: params[:user][:password], body: params[:user][:body]})
    if @user.save
      redirect_to user_path @user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update({name: params[:user][:name], email: params[:user][:email], age: params[:user][:age], password: params[:user][:password], body: params[:user][:body]})
  end

  def destroy
  end

  # Only these fields are allowed on forms:
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
