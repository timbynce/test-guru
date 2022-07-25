# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badge_rewards, dependent: :destroy
  has_many :users, through: :badge_rewards

  TYPE_BADGES = %i[mixed by_category_id by_level by_attempts].freeze

  validate :one_attribute_present

  def rewarded_for?(test_passage)
    [
      check_by_category(test_passage),
      check_by_level(test_passage),
      check_by_attempts(test_passage)
    ].all?(true)
  end

  private

  def one_attribute_present
    return if [level, category, attempts].any?(&:present?)

    errors.add(:base, 'Должен быть выбран как минимум 1 аттрибут')
  end

  def check_by_category(test_passage)
    return true if category.blank?
    return false unless test_passage.category == category

    total  = Test.where(category: category).count
    passed = test_passage.user_passed_tests_with_category(category).count(:test_id)

    total == passed
  end

  def check_by_level(test_passage)
    return true if level.blank?
    return false unless test_passage.level == level

    total  = Test.where(level: level).count
    passed = test_passage.user_passed_tests_with_level(level).count(:test_id)

    total == passed
  end

  def check_by_attempts(test_passage)
    return true if attempts.blank?

    attempts >= test_passage.attempts
  end
end
