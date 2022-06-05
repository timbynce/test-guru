# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    tests = Test.all
    
    render plain: { tests: tests }
  end

  def show
    render plain: { tests: @test }
  end

  def new; end

  def create
    @test = Test.new(test_params)
    
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    render plain: 'Test was successfully removed'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: "Test wasn't found"
  end
end
