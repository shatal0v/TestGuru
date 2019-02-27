class ApplicationController < ActionController::Base
  
  helper_method :current_user,
                :logged_in?,
                :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      cookies[:last_path] = request.original_url
      redirect_to login_path, alert: 'Are you Guru? Verify you Email and Password please'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
