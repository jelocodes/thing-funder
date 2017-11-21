class Project < ApplicationRecord
	belongs_to :user
	has_many :rewards
	accepts_nested_attributes_for :rewards
	has_many :updates
	has_many :comments, as: :commentable
  	has_many :project_categories
  	has_many :categories, through: :project_categories
  	validates_presence_of :name, :tagline, :about, :goal, :deadline 	
end
