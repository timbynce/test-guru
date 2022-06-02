class TestsController < ApplicationController

  def index
    @tests = Test.all
    render html: { tests: @tests }
  end

  def show
    @test = Test.find(params[:id])
    render html: { tests: @test }
  end

  def new
  end

  def create
    @test = Test.create(test_params)
    render plain: @test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
