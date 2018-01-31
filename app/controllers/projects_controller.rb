class ProjectsController < ApplicationController

	def index 
		if params[:sort] === "newest"
			@projects = Project.published.recent
		elsif params[:sort] === "popular"
			@projects = Project.joins(:comments).all
		elsif params[:sort] === "time_running_out"
			@projects = Project.time_running_out
		else
			@projects = Project.all
		end
		# raise params
	end

	def show 
		@project = Project.find(params[:id])
		@comment = Comment.new
		session[:return_to] ||= request.referer
	end

	def new 
		@project = Project.new
		@category = Category.new
	end

	def create 
		# raise params
	    @project = Project.create(project_params)
	    @project.categories.create(name: params["project"]["categories"]["name"]) unless params["project"]["categories"]["name"].blank?

	    if @project.errors.size == 0
    		redirect_to project_finish_path(@project)
    	else
    		render 'new'
    	end
	end

	def edit 
		@project = Project.find(params[:id])
		if @project.rewards.size == 0
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
		end
	end

	def finish
		@project = Project.find(params[:project_id])
		if @project.rewards.size == 0
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
			@project.rewards.build(name: "")
		end
	end

	def update 
		# authorize @project
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			@project.update(published: true)
			redirect_to root_path
		else
			# redirect_to edit_project_path(@project)
			redirect_to :back
		end
		# perform an update
	end

	def delete 
		@project = Project.find(params[:id])
		authorize @project
		# delete project
	end

	def user_projects 
		@started_projects = current_user.projects
		@funded_projects = nil		
	end

	def filter 
		redirect_to :back
	end

	private 

	def project_params 
		params.require(:project).permit(
			:user_id,
			:name,
			:category_ids,
			:tagline,
			:categories,
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