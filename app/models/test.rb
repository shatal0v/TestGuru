class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'

  def self.sort_by_category(category)
    Test.joins(:category).where(categories: {title: category})
    .pluck(:title).sort.reverse
  end
end
