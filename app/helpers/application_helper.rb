module ApplicationHelper
  def year_now
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
