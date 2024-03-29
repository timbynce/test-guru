# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :badge_rewards
  has_many :badges, through: :badge_rewards
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id
  has_many :gists

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

  def passed_tests_with_level(level)
    test_passages.passed.by_level(level)
  end

  def passed_tests_with_category(category)
    test_passages.passed.by_category(category)
  end

  def test_passes(id)
    test_passages.where(test_id: id)
  end
end
