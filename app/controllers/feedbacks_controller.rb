# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    if params[:body].blank?
      flash_options = { alert: t('.empty') }
      redirect_to tests_path, flash_options
    else
      @feedback = Feedback.new(feedback_params[:body])
      flash_options = if FeedbackMailer.completed_feedback(@feedback.body, current_user.email).deliver_now
                        { notice: t('.success') }
                      else
                        { alert: t('.failure') }
                      end
      redirect_to tests_path, flash_options
    end
  end

  private

  def feedback_params
    params.permit(:body)
  end
end
