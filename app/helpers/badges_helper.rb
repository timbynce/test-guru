# frozen_string_literal: true

module BadgesHelper
  def badge_level(badge)
    return t('.easy') if test.level <= 1
    return t('.hard') if test.level >= 5

    t('.advanced')
  end
end
