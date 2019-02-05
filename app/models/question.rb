class Question < ApplicationRecord
  before_validation :validates_body
  belongs_to :test
  has_many :answers

  def validates_body
    raise if body.empty?
  end
end
