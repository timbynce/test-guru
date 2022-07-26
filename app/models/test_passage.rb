# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  validate :expired_test, on: :update

  delegate :questions, :title, :time_to_pass, :category, :level, to: :test
  delegate :passed_tests_with_level, to: :user, prefix: true
  delegate :passed_tests_with_category, to: :user, prefix: true

  scope :passed, -> { where('passed_percent >= ?', SUCCESS_PERCENT) }
  scope :by_level, ->(level) { includes(:test).where(tests: { level: level }) }
  scope :by_category, ->(category) { includes(:test).where(tests: { category: category }) }

  def completed?
    expired? || current_question.nil?
  end

  def questions_count
    questions.count
  end

  def good_result?
    result_percent > SUCCESS_PERCENT
  end

  def result_percent
    ((correct_questions * 100.00) / questions_count).round
  end

  def accept_params=(answer_ids)
    @answer_ids = answer_ids

    self.correct_questions += 1 if correct_answer?(answer_ids)
  end

  def current_question_number
    questions_count - questions.following(current_question).count
  end

  def expired?
    return false unless time_to_pass.present?

    Time.now > deadline_time
  end

  def deadline_time
    created_at + time_to_pass.minutes
  end

  def attempts
    user.test_passes(test_id).count
  end

  def update_result
    return unless completed?

    update!(passed_percent: result_percent)
  end

  private

  def expired_test
    errors.add(:base, 'test is expired') if expired?
  end

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    return questions.first unless current_question.present?

    questions.following(current_question).first
  end
end
