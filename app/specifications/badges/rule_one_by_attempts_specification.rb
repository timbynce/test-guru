# frozen_string_literal: true

module Badges
  class RuleOneByAttemptsSpecification < AbstractRuleSpecification
    def satisfied?
      attempts = @value.to_i
      attempts >= @test_passage.attempts
    end
  end
end
