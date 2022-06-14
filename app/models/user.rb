# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id

  validates :title, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    tests.list_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
