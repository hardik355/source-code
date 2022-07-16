module Validatable
	extend ActiveSupport::Concern
	include ActiveModel::Validations

	included do		
		validates_presence_of :first_name, :message => "First name can't be empty", on: :create
		validates_presence_of :last_name, :message => "Last Name can't be empty", on: :create
		validates_presence_of :email, :message => "Email can't be empty", on: :create
		validates_presence_of :password, :message => "Password can't be empty", on: :create
		validates_presence_of :password_confirmation, :message => "Confirm Password can't be empty", on: :create

		#Callback
	  before_create :password_match
	  before_create :check_user_exist
	end 

  def password_match
  	unless self.password == self.password_confirmation
  		errors.add(:password_confirmation, "Password do not match")
  	end 	
  end 

  def check_user_exist
		if User.find_by(email: self.email).present?
			errors.add(:email, "Email already exist")
		end 
  end 

end 