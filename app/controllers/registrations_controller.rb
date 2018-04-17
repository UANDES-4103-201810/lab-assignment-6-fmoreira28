class RegistrationsController < ApplicationController
	def new
	
	end

	def create
		@user = User.new(registrations_params)
		if @user.save
			flash[:notice]="User was created successful"
			redirect_to root_path
		else
			flash[:notice]="User was not created successful"
			redirect_to sign_in_path
		end
	end

	private

	def registrations_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
