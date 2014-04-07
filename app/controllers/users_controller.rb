class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def new
		@user = User.new
		# super
	end

	def destroy
		@user = User.find_by_id(params[:id])
		@user.destroy
		redirect_to users_path
		flash.notice = "#{@user.first_name} #{@user.last_name} has been deleted!"
	end

end
