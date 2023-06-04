class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    @user = User.find_by(email: session_params[:email]) || User.new

    if @user.present? && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to login_path
    else 
      # redirect_to login_path, alert: 'Email or password are invalid!' 
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user     = nil

    redirect_to login_path, notice: 'Logged out!'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
