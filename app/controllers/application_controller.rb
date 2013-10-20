class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user_logged_in?
  helper_method :current_user

  before_filter :check_logged_in

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

  def user_logged_in?
    !!current_user
  end

  def check_logged_in
    return true if user_logged_in?

    redirect_to login_path 
    false
  end
end
