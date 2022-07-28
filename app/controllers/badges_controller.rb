# frozen_string_literal: true

class BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end
end
