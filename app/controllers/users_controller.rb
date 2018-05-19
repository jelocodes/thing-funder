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
		# authorize @user
		@user = User.find(params[:id])
		@user.update(user_params)

		render :json => @user
	end

	def destroy 
		authorize @user
	end

	private 

	def user_params 
		params.require(:user).permit(:username, :bio, :twitter, :facebook, :website, :tx_hash, :reward_ids)
	end

	def set_user 
		@user = User.find(params[:id])
	end
end
