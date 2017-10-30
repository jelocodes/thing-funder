class CommentPolicy < ApplicationPolicy
	def update?
    	user.admin? || user.moderator? || record.try(:user) == user
    end
end