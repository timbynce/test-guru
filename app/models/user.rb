# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id

  validates :title, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    tests.list_by_level(level)
  end
end
