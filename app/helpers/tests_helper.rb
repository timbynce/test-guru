# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    return 'easy' if test.level <= 1
    return 'hard' if test.level >= 5

    'advanced'
  end
end
