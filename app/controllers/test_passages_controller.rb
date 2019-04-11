# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  helper_method :client_last_response
  #rescue_from NoMethodError, with: :rescue_with_empty_test

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @bages = achived_bages(@test_passage)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      flash[:notice] = "Вы получили награду!" unless @bages.empty?
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.client_last_response
      gist = Gist.create(question_id: @test_passage.current_question_id, url: result[:url], user_id: @test_passage.user_id)

      flash_options = { notice: "#{t('.success')} #{result[:html_url]}" }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  attr_reader :client_last_response

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def achived_bages(test_passage)
    @test_passage = test_passage
    bages = Bage.all
    
    bages.each do |bage|
      if self.send(bage.rule.to_sym, @test_passage)
        @test_passage.user.bages.push(bage)
      end
    end
  end

  def rescue_with_empty_test
    redirect_to root_path
    flash[:alert] = t('.emty_test')
  end

  def first_test_bage(test_passage)
    test_passage.user.tests.count == 1
  end

  def all_right_bage(test_passage)
    test_passage.percent == 100
  end

  def backend_bage(test_passage)
    completed = test_passage.user.tests.where(category_id: 1).order(id: :asc)
    all_tests_with_category = Test.where(category_id: 1).order(id: :asc)

    completed == all_tests_with_category
  end

  def embedded_bage(test_passage)
    completed = test_passage.user.tests.where(category_id: 2).order(id: :asc)
    all_tests_with_category = Test.where(category_id: 2).order(id: :asc)

    completed == all_tests_with_category
  end

  def level_1_bage(test_passage)
    completed = test_passage.user.tests.where(level: 1).order(id: :asc)
    all_tests_with_level = Test.where(level: 1).order(id: :asc)

    completed == all_tests_with_level
  end
end
