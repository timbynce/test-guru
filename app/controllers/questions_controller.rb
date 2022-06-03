# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: { tests: @test.questions }
  end

  def show
    render plain: { test: @question }
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      render plain: 'Question was successfully added'
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    render plain: 'Question was successfully removed'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question wasn't found"
  end
end
