class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_filter :set_locale
  skip_before_filter  :verify_authenticity_token

  $ROOT_URL             = "http://api.menu.am/index.php/index/"

  GET_ALL               = 'get-data'
  GET_DELIVERY          = 'delivery-price'
  GET_CATEGORY_ITEMS    = 'get-restaurant-menu-categories?rest='

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    elsif request.headers['locale']
      I18n.locale = request.headers['locale']
    end
  end

end
