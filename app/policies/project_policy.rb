class ProjectPolicy < ApplicationPolicy
	class Scope < Scope 
		def resolve 
			if user.admin? 
				scope.all 
			else
				scope.where(:published => true)
			end
		end
	end


	def update? 
		user.admin? || record.try(:user) == user
	end

	def delete?
		user.admin? || record.try(:user) == user
	end
end