class UsersController < ApplicationController

	def create	
		user = User.new(user_params)
		user.authentication = Authentication.new(authentication_params)
		if user.save
			render json: user.as_json(only:[:name,:user_name,:email_id]), status: :ok and return
		else	
			render json: {errors: user.errors }, status: :unprocessable_entity and return
		end
	end

private
	def user_params
		params[:user].permit(:name,:user_name,:email_id)
	end

	def authentication_params
		params[:user][:authentication].permit(:kind,:value)
	end
end
