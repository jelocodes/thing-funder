class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	enum role: [:maker, :admin]

	def guest?
		persisted?
	end

	class NilClass
  		def guest?
    		true
  		end
	end

end
