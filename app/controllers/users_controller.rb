class UsersController < ApplicationController
  before_action :authorize, only: [:dashboard]

  def new
    @user = User.new
  end

  def dashboard
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successful login"
      redirect_to dashboard_user_path(@user)
    else
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
