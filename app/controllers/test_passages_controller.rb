# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update

    @test_passage.update(accept_params: params[:answer_ids])

    if @test_passage.update_result
      TestRewardingService.new(@test_passage).call if @test_passage.good_result?

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
