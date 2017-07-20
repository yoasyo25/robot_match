class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successful login"
      redirect_to dashboard_user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Succesful Logout!"
    redirect_to root_path
  end
end
