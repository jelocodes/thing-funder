class Project < ApplicationRecord
	belongs_to :user
	has_many :rewards
	accepts_nested_attributes_for :rewards
	has_many :updates
	has_many :comments, as: :commentable
  	has_many :project_categories
  	has_many :categories, through: :project_categories
  	validates_presence_of :name, :tagline, :about, :goal, :deadline 

  	scope :recent, -> { order('projects.created_at DESC') }	
  	scope :published, -> { where(published: true) }
  	scope :time_running_out, -> { where('deadline < ?', Date.today + 100 ).order('deadline ASC')}
end
