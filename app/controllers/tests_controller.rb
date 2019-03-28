# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :tests_pages, only: :index
  before_action :find_test, only: :start

  def index; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def tests_pages
    @tests_pages = Test.page(params[:page]).per(3)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
