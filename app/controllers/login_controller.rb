class LoginController < ApplicationController
	
	def do_login
		unless User.where(:user_name => params[:user_name]).empty?
			user = User.where(:user_name => params[:user_name]).first
			if user.session 
				render json:{errors: "user is already logged in."}, status: :ok 
			else
				#check if password matches
				if user.authentication.kind == params[:authentication][:kind] && user.authentication.value == params[:authentication][:value]
					if user.session
						token = user.session.token
					else 
						token = Session.generate_session_token
						user.session = Session.new(token:token)
						user.session.save
					end
					render json:{
						status: "success",
						token: token
					}, status: :ok
				else render json:{errors: "credentials are wrong."}, status: :ok
				end
			end
		else
			render json:{errors: "user_name does not exists."}, status: :ok
		end
	end

end