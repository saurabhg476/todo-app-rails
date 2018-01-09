class User < ApplicationRecord
	validates :name,:user_name,:email_id ,presence: true
	validates :user_name,:email_id, uniqueness: true 

	validates_associated :authentication

	has_one :authentication
	has_one :session
end
