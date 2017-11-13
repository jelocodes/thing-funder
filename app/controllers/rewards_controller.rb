class RewardsController < ApplicationController
	def new 
		@reward = Reward.new
	end

	def create 
	    @reward = Reward.create(reward_params)
	    @project = Project.find(params[:reward][:project_id].to_i)
	    byebug
	    redirect_to edit_project_path(@project)
	end

	private 

	def reward_params 
		params.require(:reward).permit(
			:project_id,
			:name,
			:description,
			:pledge_requirement
    	)
	end
end
