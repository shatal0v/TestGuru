# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  helper_method :client_last_response
  rescue_from NoMethodError, with: :rescue_with_empty_test

  attr_reader :client_last_response
  
  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      bages_service = BageService.new(@test_passage)
      achived_bages = bages_service.achived_bages
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      flash[:notice] = "Вы получили награду!" if achived_bages
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

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_empty_test
    redirect_to root_path
    flash[:alert] = t('.emty_test')
  end
end
