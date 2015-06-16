class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def show
    @account = Account.find(params[:id])
    @journals = @account.journals
  end

  def new
    @account = Account.new
    @user = current_user
    @classifications = Classification.all
  end

  def create
    @account = Account.new(params.require(:account).permit(:name, :classification_id))
    @account.user = current_user
    @account.amount = 0
    if @account.save
      flash["notice"] = "Account was created!"
      redirect_to chartofaccounts_path
    else
      @user = current_user
      @classifications = Classification.all
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
    @user = current_user
  end

  def update
    @account = Account.find(params[:id])
    @user = current_user

    if @account.update(params.require(:account).permit(:name))
      flash["notice"] = "This account has been updated."
      redirect_to user_account_path(current_user, @account)
    else
      render 'edit'
    end
  end
end