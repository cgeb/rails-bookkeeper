class AccountsController < ApplicationController
  before_action :require_user
  before_action :set_classifications, only: [:index, :new]
  before_action :set_account, only: [:show, :edit, :update]

  def index
    @accounts = current_user.accounts
  end

  def show
    @journals = @account.journals
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params.require(:account).permit(:name, :classification_id))
    @account.user = current_user
    @account.amount = 0
    
    if @account.save
      flash["notice"] = "Account was created!"
      redirect_to chartofaccounts_path
    else
      set_classifications
      render 'new'
    end
  end

  def edit
  end

  def update
    if @account.update(params.require(:account).permit(:name))
      flash["notice"] = "This account has been updated."
      redirect_to account_path(@account)
    else
      render 'edit'
    end
  end

  private

  def set_classifications
    @classifications = Classification.all
  end

  def set_account
    @account = Account.find(params[:id])
  end
end