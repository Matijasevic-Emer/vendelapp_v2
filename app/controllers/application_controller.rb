class ApplicationController < ActionController::Base
  include Pagy::Backend
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  #Logica para que detecte el idioma del navegador y setee el idioma
  # around_action :switch_locale
  # def switch_locale(&action)
  #   I18n.with_locale(locale_from_header, &action)
  # end
  # private
  # def locale_from_header
  #   request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  # end

  before_action :set_locale
  before_action :set_current_user
  before_action :protect_pages

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def protect_pages
    redirect_to new_session_path, alert: t('common.not_logged') unless Current.user
  end
end
