class UsersController < ApplicationController
	def index 
		@users = User.all
	end

	def new 
		@user = User.new
	end

	def create 
		raise params
	    @user = User.create(user_params)
    	redirect_to user
	end

	def update 
		@user = User.find(params[:id])
		authorize @user
		# perform an update
	end

	def delete 
		@user = User.find(params[:id])
		authorize @user
		# delete user
	end

	private 

	def user_params 
		params.require(:user).permit(:username, :bio, :twitter, :facebook, :website)
	end
end
