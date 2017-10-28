class Reward < ApplicationRecord
	belongs_to :project
	has_many :user_rewards
	has_many :users, through: :user_rewards
end
