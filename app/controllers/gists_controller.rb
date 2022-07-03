# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :find_test_passage, only: %i[new create]

  def new
    @gist = Gist.new
  end

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create(gist_url: result.html_url, user: current_user, question: @test_passage.current_question)
      flash_options = { notice: t('.success', gist_url: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
