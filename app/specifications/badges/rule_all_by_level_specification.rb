# frozen_string_literal: true

module Badges
  class RuleAllByLevelSpecification < AbstractRuleSpecification
    def satisfied?
      level = @value.to_i
      return false unless @test_passage.level == level

      total  = Test.where(level: level).count
      passed = @test_passage.user_passed_tests_with_level(level).count(:test_id)

      total == passed
    end
  end
end
