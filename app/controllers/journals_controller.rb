class JournalsController < ApplicationController
  before_action :require_user 

  def index
    @journals = current_user.journals
  end

  def new
    @user = current_user
    @journal = Journal.new
    @accounts = @user.accounts
  end

  def create
    @journal = Journal.new(params.require(:journal).permit!)
    @journal.user = User.find_by(id: params[:user_id])

    @journal.debit_accounts.each_with_index do |debit_account, index|
      if debit_account != ""
        @account = Account.find_by(id: debit_account) 
        @account.update_attributes(:amount => @account.amount + @journal.debit_amounts[index].to_i)
        @journal.accounts << @account
      end
    end

    @journal.credit_accounts.each_with_index do |credit_account, index|
      if credit_account != ""
        @account = Account.find_by(id: credit_account) 
        @account.update_attributes(:amount => @account.amount - @journal.credit_amounts[index].to_i)
        @journal.accounts << @account
      end
    end

    if @journal.save
      flash["notice"] = "Journal was created!"
      redirect_to chartofaccounts_path
    else
      render 'new'
    end
  end
end