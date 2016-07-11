class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  $ROOT_URL                 = "http://api.menu.am/index.php/index/"

end
