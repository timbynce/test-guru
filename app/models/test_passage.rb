# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question, if: -> { answer_ids.present? }

  delegate :questions, :title, to: :test

  attr_reader :answer_ids

  def completed?
    current_question.nil?
  end

  def questions_count
    questions.count
  end

  def good_result?
    result_percent > SUCCESS_PERCENT && completed?
  end

  def result_percent
    (correct_questions * 100.00) / questions.count
  end

  def answer_ids=(answer_ids)
    @answer_ids = answer_ids

    self.correct_questions += 1 if correct_answer?(answer_ids)
  end

  def current_question_number
    questions.count - questions.following(current_question).count
  end

  private

  def before_validation_set_first_question
    self.current_question = questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = questions.following(current_question).first
  end
end
