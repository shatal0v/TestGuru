class Admin::TestsController < Admin::BaseController
  
  before_action :tests_pages, only: :index
  before_action :find_test, only: %i[show start destroy]

  def index

  end

  def show
    
  end

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

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

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

  def test_params
    params.require(:test).permit(:title, :level)
  end

end
