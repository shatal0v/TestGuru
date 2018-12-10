class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validate :validate_min_level
  validates_uniqueness_of :title, scope: :level

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category, -> (category) { 
    joins(:category).where(categories: {title: category})
    .pluck(:title).sort.reverse }

  private
  
  def validate_min_level
    errors.add(:level) if level.to_i < 0
  end
end
