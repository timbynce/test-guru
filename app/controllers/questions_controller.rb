# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: { tests: @test.questions }
  end

  def show
    question = @test.questions.find(params[:id])

    render plain: { test: question }
  end

  def new; end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    question = @test.questions.find(params[:id])
    question.destroy

    render plain: 'Question was successfully removed'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question wasn't found"
  end
end
