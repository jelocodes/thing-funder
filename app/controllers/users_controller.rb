class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index 
		@users = User.all
	end

	def new 
		@user = User.new
	end

	def create 
	    @user = User.create(user_params)
    	redirect_to user
	end

	def update 
		authorize @user
	end

	def destroy 
		authorize @user
	end

	private 

	def user_params 
		params.require(:user).permit(:username, :bio, :twitter, :facebook, :website)
	end

	def set_user 
		@user = User.find(params[:id])
	end
end
