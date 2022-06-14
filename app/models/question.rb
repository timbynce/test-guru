# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  scope :following, ->(question) { order(:id).where('id > ?', question.id) }
end
