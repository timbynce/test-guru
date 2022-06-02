# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test

  def index
    @questions = @test.questions
    render html: { tests: @test.questions }
  end

  def show
    @question = @test.questions.find(params[:id])
    render html: { tests: @question }
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
    render plain: 'Question was successfully removed'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
