# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  def completed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    type == 'Admin'
  end
end
