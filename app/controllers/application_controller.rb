class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :find_account_name

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      flash[:error] = "You need to be logged in to do this."
      redirect_to login_path
    end
  end

  def find_account_name(debit_or_credit_account)
    Account.find(debit_or_credit_account).name
  end
end
