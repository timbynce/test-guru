# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :results
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: :uniq_title_with_level }

  validates :level, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :list_by_category, ->(category) {
                             joins(:category)
                               .where(categories: { title: category })
                               .order(title: :desc)
                           }

  scope :list_by_level, ->(level) { where(level: level) }
end
