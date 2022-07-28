# frozen_string_literal: true

class BadgeRewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @badge_rewards = current_user.badge_rewards
  end
end
