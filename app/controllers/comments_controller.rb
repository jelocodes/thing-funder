class CommentsController < ApplicationController
	def create 
		@comment = Comment.create(comment_params)
		redirect_to comment.post 
	end

	def update 
		@comment = Comment.find(params[:id])
		authorize @comment
		# update comment
	end

	def delete 
		@comment = Comment.find(params[:id])
		authorize @comment 
		# delete comment
	end

	private 
		params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id, user_attributes: [:username])
	end
end
