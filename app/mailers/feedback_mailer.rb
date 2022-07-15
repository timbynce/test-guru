# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def completed_feedback(body, user)
    @body = body
    # for user mail feedback
    # mail to: user.mail
    mail to: 'cherar90@gmail.com'
  end
end
