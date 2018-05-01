module ProjectsHelper

	def days_to_go(project)
		(project.deadline - Date.today).to_i
	end

	def funded?(project)
		project.update(funds: 0) if project.funds == nil 
		project.funds / project.goal == 100
	end

end
