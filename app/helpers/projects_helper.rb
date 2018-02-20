module ProjectsHelper

	def days_to_go(project)
		(project.deadline - Date.today).to_i
	end

end
