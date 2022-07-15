# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    if find_questions
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash_options = { alert: t('.failure') }
      redirect_to root_path, flash_options
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @test.questions.present?
  end

  def rescue_with_test_not_found
    render plain: "Test wasn't found"
  end
end
