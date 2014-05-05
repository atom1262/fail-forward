class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= find_current_user
  end
  helper_method :current_user

  def find_current_user
    find_session_user || Guest.new
  end

  def find_session_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

end
