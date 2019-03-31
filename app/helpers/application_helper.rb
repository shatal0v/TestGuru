# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_CSS_CLASSES = { notice: 'primary', alert: 'danger' }.freeze
  DEFAULT_BOOTSTRAP_CSS_CLASS = :primary

  def year_now
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def bootstrap_alert_css_class(key)
    css_class = BOOTSTRAP_CSS_CLASSES[key.to_sym] || DEFAULT_BOOTSTRAP_CSS_CLASS
    "alert alert-#{css_class}"
  end
end
