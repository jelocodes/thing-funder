class ProjectBacker < ApplicationRecord
	belongs_to :project 
	belongs_to :user

	def percentage_backed 
		return self.times_backed == nil ? 25 : (((self.times_backed).to_f / 4.to_f) * 100).to_i 
	end
end
