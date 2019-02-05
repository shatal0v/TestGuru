class QuestionsController < ApplicationController
  before_action :find_test_questions
  rescue_from NoMethodError, with: :rescue_with_question_not_found

  def index
    render inline: "
    <p><%= 'EMPTY TEST' if @questions.empty? %></p>
    <% @questions.each do |question| %>
      <br><%= question.body %></br>
    <% end %>"
  end

  def show
    @question = @questions[params[:id].to_i - 1]
  end

  def new

  end

  def create
    @question = Question.new(question_body)
    @question.test_id = params[:test_id]
    @question.save
    redirect_to test_questions_path
  end

  def destroy
    show
    @question.destroy!
    redirect_to test_questions_path
  end

  private

  def question_body
    params.require(:question).permit(:body)
  end

  def find_test_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
