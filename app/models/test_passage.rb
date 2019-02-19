class TestPassage < ApplicationRecord
  TEST_PASSED_VALUE = 85
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def test_passed?
    self.correct_questions >= (test.questions.count * TEST_PASSED_VALUE / 100.0)
  end

  def percent
    percent = (self.correct_questions / test.questions.count.to_f) * 100.0
    percent.round(2)
  end

  def question_ids
    test.questions.order(:id).pluck(:id)
  end

  private

  def before_validation_set_first_question
    if self.current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
