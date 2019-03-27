# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    if params[:lang] == 'ru' || params[:lang].nil?
      {}
    else
      { lang: I18n.locale }
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
