class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to chartofaccounts_path
    end
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash["notice"] = "Welcome, you've logged in."
      redirect_to chartofaccounts_path
    else
      flash["error"] = "There was something wrong with your username or password."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash["notice"] = "You've logged out."
    redirect_to login_path
  end
end