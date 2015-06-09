class UsersController < ApplicationController
  def show
    @classifications = Classification.all
    @accounts = current_user.accounts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save
      session[:user_id] = @user.id
      flash["notice"] = "You're registered!"
      redirect_to chartofaccounts_path
    else
      render 'new'
    end
  end
end