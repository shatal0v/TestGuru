class QuestionsController < ApplicationController
  before_action :find_test_questions, only: :index
  before_action :find_question, only: %i[show destroy]
  #rescue_from NoMethodError, with: :rescue_with_question_not_found
  #rescue_from RuntimeError, with: :rescue_with_question_body_is_empty

  def index
    render inline: "
    <p><%= 'EMPTY TEST' if @questions.empty? %></p>
    <% @questions.each do |question| %>
      <br><%= question.body %></br>
    <% end %>"
  end

  def show
    @question
  end

  def new

  end

  def create
    @test = Test.find(params[:test_id])
    question = @test.questions.new(question_body)
    if question.save
      redirect_to test_questions_path
    else
      render plain: "Not saved"
    end
  end

  def destroy
    @question.destroy
    render plain: "Question deleted."
  end

  private

  def question_body
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end

  def rescue_with_question_body_is_empty
    render plain: "Not Created. Question can't be empty."
  end
end
