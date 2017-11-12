class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
	end

	def new 
		@project = Project.new
		@category = Category.new

		@project.rewards.build(name: "Enter reward's name")
	end

	def create 
	    @project = Project.create(project_params)
    	redirect_to root_path
	end

	def update 
		@project = Project.find(params[:id])
		authorize @project
		# perform an update
	end

	def delete 
		@project = Project.find(params[:id])
		authorize @project
		# delete project
	end

	private 

	def project_params 
		params.require(:project).permit(
			:user_id,
			:name,
			:about,
			:faq,
			:goal,
			:risk_and_challenges,
			:deadline,
			rewards_attributes: [
      			:name,
      			:description,
      			:pledge_requirement
      		]
    	)
	end
end