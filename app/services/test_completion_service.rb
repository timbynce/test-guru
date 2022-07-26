# frozen_string_literal: true

class TestCompletionService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      @user.badge_rewards.create(badge: badge) if rewarded_for?(badge)
    end

    TestsMailer.completed_test(@test_passage).deliver_now
  end

  def rewarded_for?(badge)
    return false unless @test_passage.good_result?

    check = Badge::TYPE_BADGES.find { |type| type == badge.rule_type }
    param = badge.rule_attribute_value

    send("check_by_#{check}?", param)
  end

  private

  # эти два правила можно было бы заменить на нечто вида check_all_by_attribute,
  # что сократило бы код. Но для единичных атрибутов, все не так однозначно.
  # Плюс в check_all пришлось бы добавлять проверку по каким атрибутам можно запускать такое правило (например, по попыткам нельзя)
  def check_by_category?(category)
    category = category.to_i
    return false unless @test_passage.category.id == category

    total  = Test.where(category: category).count
    passed = @test_passage.user_passed_tests_with_category(category).count(:test_id)

    total == passed
  end

  def check_by_level?(level)
    level = level.to_i
    return false unless @test_passage.level == level

    total  = Test.where(level: level).count
    passed = @test_passage.user_passed_tests_with_level(level).count(:test_id)

    total == passed
  end

  def check_by_attempts?(attempts)
    attempts.to_i >= @test_passage.attempts
  end
end
