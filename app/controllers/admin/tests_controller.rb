# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :tests_pages, only: %i[index update_inline]
  before_action :find_test, only: %i[show start edit update destroy update_inline]

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def create
    category = Category.find_by(title: params[:test][:category])

    @test = category.tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: "#{@test.title} #{t('.delete_test')}"
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def tests_pages
    @tests_pages = Test.page(params[:page]).per(6)
  end

  def find_test
    @test = if params[:id]
              Test.find(params[:id])
            else
              Test.find(params[:test_id])
    end
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
