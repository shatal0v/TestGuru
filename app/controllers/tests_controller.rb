class TestsController < ApplicationController
  before_action :tests_pages, only: %i[index show]

  def index

  end

  def show
    @test = Test.find(params[:id])
    render :index
  end

  def tests_pages
    @tests = Test.page(params[:page]).per(1)
  end
end
