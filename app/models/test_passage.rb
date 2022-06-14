# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question 

  delegate :questions, :title, to: :test

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

  def answered_questions_ids=(answer_ids)
    @answer_ids = answer_ids
  
    self.correct_questions += 1 if correct_answer?(answer_ids)
  end

  def current_question_number
    questions.count - questions.following(current_question).count
  end

  private
  
  def set_current_question    
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort && answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    return questions.first unless @answer_ids.present?
    
    questions.following(current_question).first 
  end

end
