# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :test_passages, class_name: 'TestPassage', foreign_key: :current_question_id, dependent: :destroy

  validates :body, presence: true

  delegate :author, to: :test

  scope :following, ->(question) { order(:id).where('id > ?', question.id) }
end
