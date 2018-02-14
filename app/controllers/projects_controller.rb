class ProjectsController < ApplicationController

	def index 
		if params[:search]
			@projects = Project.search(params[:search])
		elsif params[:sort] === "newest"
			@projects = Project.published.recent
		elsif params[:sort] === "popular"
			@projects = Project.joins(:comments).all
		elsif params[:sort] === "time_running_out"
			@projects = Project.time_running_out
		else
			@projects = Project.all
		end
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
	    @project = current_user.projects.create(project_params)
	    @project.categories.create(name: params["project"]["categories"]) unless params["project"]["categories"].blank?

	    if @project.errors.size == 0
    		redirect_to project_finish_path(@project)
    	else
    		render 'new'
    	end
	end

	def edit 
		@project = Project.find(params[:id])
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
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			@project.update(published: true)
			redirect_to root_path
		else
			render 'finish'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to root_path
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
			:tagline,
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