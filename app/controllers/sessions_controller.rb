class SessionsController < ApplicationController
  
  helper_method :flash_alert

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:last_path] || root_path
    else
      flash.now[:alert] = flash_alert
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def flash_alert
    'Are you Guru? Verify you Email and Password please'
  end
end
