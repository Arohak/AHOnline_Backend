Rails.application.routes.draw do

  namespace :get do
    get '/all',       to: 'parse#parse'
    get '/menu',      to: 'parsemenu#parse'
    get '/product',   to: 'parseproduct#parse'
    get '/delivery',  to: 'parsedelivery#parse'
    get '/address',   to: 'parseaddress#parse'
  end

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

      resources :products, only: [:index, :show]

      resources :deliveries, only: [:index, :show]

      get '/home', to: 'objects#home'
      get '/newobjects', to: 'objects#news'
      get '/rateobjects', to: 'objects#rate'
      get '/openobjects', to: 'objects#open'

      get '/nears_objects', to: 'restaurants#nearst'

    end
  end

end
