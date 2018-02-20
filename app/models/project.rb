class Project < ApplicationRecord
	belongs_to :user
	has_many :rewards, dependent: :destroy
	has_many :updates, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories, dependent: :destroy
  validates_presence_of :name, :tagline, :about, :goal, :deadline 
  validates_associated :rewards
  validate :deadline_cannot_be_in_the_past

  scope :recent, -> { order('projects.created_at DESC') }	
  scope :published, -> { where(published: true) }
  scope :time_running_out, -> { where('deadline < ?', Date.today + 100 ).order('deadline ASC')}

  has_attached_file :image, styles: { medium: "640x480>", thumb: "350x205>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def rewards_attributes=(rewards_attributes)
    rewards_attributes.values.each do |reward_attributes|
      if Reward.find_by_name(reward_attributes["name"])
        Reward.find_by_name(reward_attributes["name"]).update(reward_attributes)
      else
         self.rewards.build(reward_attributes)
      end
    end
  end

  def self.search(search)
    if search
      Project.where("name LIKE ?", "%#{search}%")
    else
      Project.all
    end
  end

  def deadline_cannot_be_in_the_past 
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "Project deadline can't be in the past")
    end
  end

  def add_categories(category_params)
    self.categories << Category.find_or_create_by(name: category_params) unless category_params.blank?
  end

end
