# frozen_string_literal: true

class Feedback
  include ActiveModel::Model
  attr_reader :body

  def initialize(body)
    @body = body
  end
end
