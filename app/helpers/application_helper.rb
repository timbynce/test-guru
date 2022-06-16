# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    content_tag :div do
      flash.each do |key,message|
        concat content_tag(:p, message, class: "flash #{key}")
      end
    end
  end
  
end