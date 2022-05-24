# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :tests_by_author, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def tests_by_level(level)
    tests.where(level: level)
  end

end
