class Reward < ApplicationRecord
	belongs_to :project
	has_many :user_rewards, dependent: :destroy
	has_many :users, through: :user_rewards
end
