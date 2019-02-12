class TestsController < ApplicationController
  before_action :tests_pages, only: %i[index show]

  def index
  end

  def show
    @test = Test.find(params[:id])
  end

  def tests_pages
    @tests_pages = Test.page(params[:page]).per(3)
  end
end
