# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.list_by_category(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
