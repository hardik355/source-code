class SessionsController < ApplicationController

  layout 'home_dashboard'

  def new; end

  # User Session Create 
  def create         
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id   
      redirect_to user_home_path
    elsif @user.present?      
      flash[:notice] = "Invalid username/password combination."
      redirect_to sign_in_path
    else 
      flash[:notice] = "Please try to create an account again!"
    end 
  end

end
