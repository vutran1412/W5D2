class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def login!(user)
    session[:session_token] = user.reset_token!
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!(current_user)
  end

  def logout!
    session[:session_token] = nil if logged_in?
    @current_user.reset_token!
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end