# frozen_string_literal: true

class TestRewardingService
  RULES = {
    category: Badges::RuleAllByCategorySpecification,
    level: Badges::RuleAllByLevelSpecification,
    attempts: Badges::RuleOneByAttemptsSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(value: badge.rule_attribute_value, test_passage: @test_passage)

      @user.badge_rewards.create(badge: badge) if rule.satisfied?
    end

    TestsMailer.completed_test(@test_passage).deliver_now
  end
end
