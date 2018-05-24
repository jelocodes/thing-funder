class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	enum role: [:maker, :admin]
  has_many :projects
  has_many :updates
  has_many :comments
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  validates_uniqueness_of :username
  validates_presence_of :username
  before_create :set_default_role, :if => :new_record?


	def guest?
		persisted?
	end

	class NilClass
  		def guest?
    		true
  		end
	end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def gravatar_url
    email_address = self.email
    gravatar = Digest::MD5::hexdigest(email_address).downcase 
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#64"
    return !!url ? url : "http://www.gravatar.com/avatar/?d=identicon"
  end

  def gravatar_url_small
    email_address = self.email
    gravatar = Digest::MD5::hexdigest(email_address).downcase 
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#32"
    return !!url ? url : "http://www.gravatar.com/avatar/?d=identicon"
  end

  private 

  def set_default_role
    self.role ||= :maker
  end

end



