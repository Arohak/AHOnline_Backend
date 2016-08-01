class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  $ROOT_URL                 = "http://api.menu.am/index.php/index/"

end
