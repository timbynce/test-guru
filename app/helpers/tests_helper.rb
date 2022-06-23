# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    return t('.easy') if test.level <= 1
    return t('.hard') if test.level >= 5

    t('.advanced')
  end
end
