class QuestionsController < ApplicationController
  
  before_action :authenticate_user!, unless: :logged_in?
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]
  rescue_from NoMethodError, with: :rescue_with_question_not_found
  rescue_from RuntimeError, with: :rescue_with_question_body_is_empty

  def show
    
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_body)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @question.update(question_body)
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
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
