# frozen_string_literal: true

module Badges
  class RuleAllByCategorySpecification < AbstractRuleSpecification
    def satisfied?
      category = @value.to_i
      return false unless @test_passage.category.id == category

      total  = Test.where(category: category).count
      passed = @test_passage.user_passed_tests_with_category(category).count(:test_id)

      total == passed
    end
  end
end
