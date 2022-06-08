# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy edit update]
  before_action :find_questions, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

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

    redirect_to tests_path
  end

  def edit;  end

  def update

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: "Test wasn't found"
  end
end
