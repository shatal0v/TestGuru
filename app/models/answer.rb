class Answer < ApplicationRecord
  MAX_ANSWER =4
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:question) if question.answers.count >= MAX_ANSWER
  end
end
