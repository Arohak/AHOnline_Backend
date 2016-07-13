Rails.application.routes.draw do

  get '/parse', to: 'getdata#parse'
  get '/parse_c', to: 'getdata#parsecategory'

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show] do
        resources :subcategories, only: [:index, :show]
      end

      resources :restaurants, except: [:show] do
        resources :categoryitems, only: [:index, :show]
      end

      get 'restaurants/home', to: 'restaurants#home'
    end
  end

end
