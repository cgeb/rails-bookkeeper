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
      render 'new'
    end
  end

  def edit

  end

  def update

  end
end