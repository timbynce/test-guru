# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
