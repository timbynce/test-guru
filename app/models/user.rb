# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP.freeze

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  validates :title, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_FORMAT, message: ': Wrong email format!' },
                    on: :create

  def tests_by_level(level)
    tests.list_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
