class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication
    if current_user.nil?
      redirect_to home_path, :alert => "You must be logged in!"
    end
  end
end
