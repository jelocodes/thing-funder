class User < ApplicationRecord
	enum role: [:donor, :maker, :admin]

	def guest?
		persisted?
	end

end
