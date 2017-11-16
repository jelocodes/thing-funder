class CommentsController < ApplicationController

	before_action :find_commentable

	def new 
		@comment = Comment.new 
	end 

	def create 
		@commentable = Project.find(params[:comment][:commentable_id])
		@comment = @commentable.comments.new(comment_params) 
		if @comment.save 
			redirect_to session.delete(:return_to), notice: 'Your comment was successfully posted!'
		else 
			redirect_to session.delete(:return_to), notice: "Your comment wasn't posted! Try again!"
		end
	end

	def update 
		@comment = Comment.find(params[:id])
		# authorize @comment
		@comment.update(comment_params)
		redirect_to :back, notice: 'Your comment was edited successfully!'
	end

	def delete 
		@comment = Comment.find(params[:id])
		# authorize @comment 
		@comment.destroy
		redirect_to :back, notice: 'Your comment was deleted!'
	end

	private 

	def comment_params 
		params.require(:comment).permit(:content, :user_id, :commentable_id)
	end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Project.find_by_id(params[:project_id]) if params[:comment][:project_id]
    end

end
