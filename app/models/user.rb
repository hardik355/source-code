class User < ApplicationRecord
		# Create Slug
	extend FriendlyId
	
	# Concern
	include Validatable
	include BCrypt

	has_secure_password

	#Relationship
	has_one_attached :profile_pic, dependent: :destroy
	has_many :address, dependent: :destroy

	# Generate Slug for User 
  friendly_id :uniqueslug, use: :slugged

  def uniqueslug
  	"#{first_name}-#{SecureRandom.hex(5)}"
  end
end
