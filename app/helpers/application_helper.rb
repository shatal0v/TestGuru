# frozen_string_literal: true

module ApplicationHelper
  def year_now
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
