class Badge < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badge_rewards
  has_many :users, through: :badge_rewards

  TYPE_BADGES = %i[by_category by_level by_attempts].freeze

  def rewarded_for?(test_passage)
    check_by_category(test_passage) ||
    check_by_level(test_passage) ||
    check_by_attempts(test_passage)
  end

  private

  def check_by_category(test_passage)
    return false unless test_passage.category == category

    total  = Test.where(category: category).count
    passed = test_passage.user_passed_tests_with_category(category).count(:test_id)
    
    return false unless total

    total == passed
  end

  def check_by_level(test_passage)
    return false unless test_passage.level == level

    total  = Test.where(level: level).count
    passed = test_passage.user_passed_tests_with_level(level).count(:test_id)

    return false unless total

    total == passed
  end

  def check_by_attempts(test_passage)
    return false unless attempts

    attempts >= test_passage.attempts
  end
end
