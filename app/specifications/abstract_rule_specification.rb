# frozen_string_literal: true

class AbstractRuleSpecification
  def initialize(value:, test_passage:)
    @value = value
    @test_passage = test_passage
  end

  def satisfied?; end
end
