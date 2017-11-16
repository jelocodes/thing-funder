class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
	end

	def show 
		@project = Project.find(params[:id])
	end

	def new 
		@project = Project.new
		@category = Category.new
	end

	def create 
	    @project = Project.create(project_params)
    	redirect_to edit_project_path(@project)
	end

	def edit 
		@project = Project.find(params[:id])
		if @project.rewards.size == 0
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
		end
	end

	def update 
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			@project.update(published: true)
			redirect_to root_path
		else
			redirect_to edit_project_path(@project)
		end
		# authorize @project
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
			:category_ids,
			:about,
			:faq,
			:goal,
			:risk_and_challenges,
			:deadline,
			rewards_attributes: [
      			:name,
      			:description,
      			:pledge_requirement
      		],
    	)
	end
end