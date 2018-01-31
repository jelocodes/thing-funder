class Project < ApplicationRecord
	belongs_to :user
	has_many :rewards, dependent: :destroy
	has_many :updates, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories, dependent: :destroy
  validates_presence_of :name, :tagline, :about, :goal, :deadline 

  scope :recent, -> { order('projects.created_at DESC') }	
  scope :published, -> { where(published: true) }
  scope :time_running_out, -> { where('deadline < ?', Date.today + 100 ).order('deadline ASC')}

  def rewards_attributes=(rewards_attributes)
    rewards_attributes.values.each do |reward_attributes|
      self.rewards.build(reward_attributes)
    end
  end

end
