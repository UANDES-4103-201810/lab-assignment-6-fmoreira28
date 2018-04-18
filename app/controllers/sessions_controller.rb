class SessionsController < ApplicationController
	def new
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		@user = User.where(email: email,password: password).first
		if @user.nil?
			flash[:notice] = "Log in failed"
			redirect_to root_path
		else
			flash[:notice] = "Log in success"
      session[:current_user_id] = @user.id
			redirect_to @user
		end
	end

	def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have log out."
    redirect_to root_url
	end
end
