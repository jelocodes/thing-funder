class CommentsController < ApplicationController

	before_action :find_commentable
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :authorize_user, only: [:destroy]	

	def new 
		@comment = Comment.new 
	end 

	def create 
		@commentable = Project.find(params[:comment][:commentable_id])
		@comment = @commentable.comments.new(comment_params) 
		if @comment.save 
			redirect_to project_path(@commentable), notice: 'Your comment was successfully posted!'
		else 
			redirect_to session.delete(:return_to), notice: "Your comment wasn't posted! Try again!"
		end
	end

	def update 
		@comment.update(comment_params)
		redirect_to :back, notice: 'Your comment was edited successfully!'
	end

	def destroy
		@project = @comment.commentable
		@comment.destroy
		redirect_to project_path(@project), notice: 'Your comment was deleted!'
	end

	private 

	def set_comment
		@comment = Comment.find(params[:id])
	end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Project.find_by_id(params[:project_id]) if params[:id] || params[:comment][:project_id] 
    end

	def comment_params 
		params.require(:comment).permit(:content, :user_id, :commentable_id)
	end

	def authorize_user
		redirect_to '/', alert: "You're not allowed to do that!" unless current_user && current_user.admin? || current_user.try(:id) == @comment.user_id
	end

end
