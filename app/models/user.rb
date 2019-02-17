class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates_presence_of :name, :email
  
  def completed_tests(level)
    tests.where(level: level)
  end
end
