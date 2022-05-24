# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.list_by_category(title)
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
