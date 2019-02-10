class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]
  #rescue_from NoMethodError, with: :rescue_with_question_not_found
  #rescue_from RuntimeError, with: :rescue_with_question_body_is_empty

  def index
    tests = Test.all
    now_stage_number = tests.index(@test)
    if tests.size > 0
      @previous_test = tests[now_stage_number - 1] if now_stage_number > 0
      @next_test = tests[now_stage_number + 1] if @test != tests.last
    else 
      render plain: 'Empty'
    end
  end

  def show
    
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_body)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @question.update(question_body)
    redirect_to test_questions_path(@question.test)
  end

  def destroy
    @question.destroy
    render inline: "
                    <p>Question deleted</p>
                    <%= link_to 'Back', test_questions_path(@question.test) %>"
  end

  private

  def question_body
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end

  def rescue_with_question_body_is_empty
    render plain: "Not Created. Question can't be empty."
  end
end
