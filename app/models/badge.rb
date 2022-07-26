# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_rewards, dependent: :destroy
  has_many :users, through: :badge_rewards

  TYPE_BADGES = %w[category level attempts].freeze
end
