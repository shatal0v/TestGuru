class Answer < ApplicationRecord
  MAX_COUNT = 4
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:question) if question.answers.count >= MAX_COUNT
  end
end
