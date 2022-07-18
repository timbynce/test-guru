# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @feedback = Feedback.new(feedback_params[:body])
    flash_options = if FeedbackMailer.completed_feedback(@feedback.body, current_user.email).deliver_now
                      { alert: t('.success') }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to tests_path, flash_options
  end

  private

  def feedback_params
    params.permit(:body)
  end
end
