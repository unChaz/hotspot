class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_admin?
  helper_method :user_content_manager?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_admin?
    return @current_user.role == 2
  end

  def user_content_manager?
    return @current_user.role == 1
  end

end
