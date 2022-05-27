# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    errors.add(:base, :answers_limit) if question.answers.count >= 4
  end
end
