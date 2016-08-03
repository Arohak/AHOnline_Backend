class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_filter :set_locale

  # def set_locale
  #   if defined?(params) && params[:locale]
  #     I18n.locale = params[:locale]
  #   elsif defined?(request)
  #     I18n.locale = extract_locale_from_accept_language_header
  #   end
  # end

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    elsif request.headers['locale']
      I18n.locale = request.headers['locale']
    end
  end

  $ROOT_URL                 = "http://api.menu.am/index.php/index/"

end
