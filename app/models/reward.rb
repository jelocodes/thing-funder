class Reward < ApplicationRecord
	belongs_to :project
	has_many :user_rewards, dependent: :destroy
	has_many :users, through: :user_rewards
	validates_presence_of :name, :description, :pledge_requirement

	def number_claimed
		return self.users.length
	end
end
