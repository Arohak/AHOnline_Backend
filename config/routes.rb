Rails.application.routes.draw do

  get '/parse', to: 'getdata#parse'

  namespace :api do
    namespace :v1 do
      get 'restaurants/home', to: 'restaurants#home'

      # resources :profiles do
        # get :me, on: :collection
      # end

    end
  end

end
