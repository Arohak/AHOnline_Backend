Rails.application.routes.draw do

  get '/parse',           to: 'getdata#parse'
  get '/parse_menu',      to: 'getdata#parse_menu'
  get '/parse_product',   to: 'getdata#parse_product'
  get '/parse_delivery',  to: 'getdata#parse_delivery'

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show] do
        resources :subcategories, only: [:index, :show]
      end

      resources :restaurants do
        resources :categoryitems, only: [:index, :show]
      end

      resources :categoryitems do
        resources :products, only: [:index, :show]
      end

      resources :deliveries, only: [:index, :show]

      get '/home', to: 'home#index'
    end
  end

end
