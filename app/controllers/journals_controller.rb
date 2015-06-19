class JournalsController < ApplicationController
  before_action :require_user 

  def index
    @journals = current_user.journals
  end

  def new
    @journal = Journal.new
    @accounts = current_user.accounts
  end

  def create
    @journal = Journal.new(params.require(:journal).permit!)
    @journal.user = User.find_by(id: params[:user_id])
    
    @journal.get_debits
    @journal.get_credits

    if @journal.save
      flash["notice"] = "Journal was created!"
      redirect_to chartofaccounts_path
    else
      @journal.reload_fields
      @accounts = current_user.accounts
      render 'new'
    end
  end
end