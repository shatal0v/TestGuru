class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  
  def completed_tests(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
    .where('passed_tests.user_id = ? AND tests.level = ?', id, level)
  end
end
