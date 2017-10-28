class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	enum role: [:maker, :admin]
  has_many :projects
  has_many :updates
  has_many :comments
  has_many :user_rewards
  has_many :rewards, through: :user_rewards


	def guest?
		persisted?
	end

	class NilClass
  		def guest?
    		true
  		end
	end

end
