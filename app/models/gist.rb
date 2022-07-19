# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user, uniqueness: { scope: :question }
  validates :gist_url, presence: true, on: :update
end
