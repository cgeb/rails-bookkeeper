class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if @user.save
      flash["notice"] = "You're registered!"
      redirect_to login_path
    else
      render 'new'
    end
  end
end