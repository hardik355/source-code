class UsersController < ApplicationController
	protect_from_forgery except: :build_address
  
  # Before Action Check
  before_action :require_login, only: [:user_home]
  layout :choose_layout

	def choose_layout	
		if current_user.present?			
		 'user_layout'
		else			
		 'home_dashboard'
		end 
	end 

	def user_home; end

	# User Initialize
	def new
		@user = User.new 		
	end

	# New User Create
	def create		
		@user = User.new(user_params)
		if @user.save
		  # redirect_to edit_user_path(slug: @user.slug)
      flash[:notice] = "User Save sucessfully"
		else			
			render 'new'
		end 
	end

	def edit
		@user = User.find_by(slug: params[:slug])
	end  

	def update
		user = User.find_by(slug: params[:slug])
		user.update!(user_params)
	end 

	# Address Create Object
	def build_address		
		@user = User.find_by(slug: params[:slug])
	end 

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profile_pic)
	end 

end 