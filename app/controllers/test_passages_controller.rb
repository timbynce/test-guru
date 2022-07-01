# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.update(answered_questions_ids: params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
  
    if result.success?
      Gist.create(gist_url: result.html_url, user: current_user, question: @test_passage.current_question)
      flash_options = { notice: t('.success', link_to_gist: link_to_gist(result)) }
    else
      flash_options = { alert: t('.failure') }
    end
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def link_to_gist(gist)
    gist.html_url
  end
end
