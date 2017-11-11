class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
	end

	def new 
		@project = Project.new
		@reward = Reward.new
		@category = Category.new
	end

	def create 
	    @project = Project.create(project_params)
    	redirect_to project
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
		params.require(:project).permit()
	end
end
