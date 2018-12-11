class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :level
  validates :level, numericality: { only_integer: true,
                                    greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category, -> (category) { joins(:category).
                                           where(categories: {title: category}).
                                           order(title: :desc) }
end
