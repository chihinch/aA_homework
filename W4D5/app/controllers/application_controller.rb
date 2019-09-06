class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # Either there is a @current_user or we'll find it from the session_token
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def login!(user)
    # Resets the user's session_token
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user # If @current_user is nil, this will return false
  end

  def logout!
    # Reset the session_token, reset @current_user and session[:session_token] to nil
    current_user.reset_session_token!
    # @current_user = nil
    session[:session_token] = nil
  end

  
end
