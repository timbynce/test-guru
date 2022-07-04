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
      flash_options = { notice: t('.success', gist_url: gist_url(result))}
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_url(gist)
    view_context.link_to(gist.html_url, gist.html_url, target: '_blank')
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
