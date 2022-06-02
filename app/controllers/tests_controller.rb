# frozen_string_literal: true

class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    render html: { tests: @tests }
  end

  def show
    @test = Test.find(params[:id])
    render html: { tests: @test }
  end

  def new; end

  def create
    @test = Test.create(test_params)
    render plain: @test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: "Test wasn't found"
  end
end
