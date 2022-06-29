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
      flash.each do |key, message|
        concat content_tag(:div, message, class: "alert alert-#{flash_level_to_bootstrap(key)}", role: 'alert')
      end
    end
  end

  private

  def flash_level_to_bootstrap(level)
    case level
    when 'notice' then 'info'
    when 'success' then 'success'
    when 'error' then 'danger'
    when 'alert' then 'warning'
    end
  end
end
