class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :require_logged_in
  helper_method :current_user
  helper_method :real_user
  private

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    session[:user_id]
  end

  def real_user
    User.find_by(id: session[:user_id])
  end

  def require_logged_in
    redirect_to '/' unless user_is_authenticated
  end
  
end
