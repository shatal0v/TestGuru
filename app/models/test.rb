class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :level
  validates :level, numericality: { only_integer: true,
                                    greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category)
                                     .where(categories: {title: category}) }
  
  def self.sort_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
