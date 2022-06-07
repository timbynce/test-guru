# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
