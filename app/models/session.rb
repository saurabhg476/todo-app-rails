class Session < ApplicationRecord
  belongs_to :user

  def self.generate_session_token
	loop do	
		token = SecureRandom.urlsafe_base64(nil,false)
        break token unless Session.where(token: token).first
  	end
  end
end
