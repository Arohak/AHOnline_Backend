Rails.application.routes.draw do

  get '/parse', to: 'getdata#parse'

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show] do
        resources :subcategories, only: [:index, :show]
      end
      get 'restaurants/home', to: 'restaurants#home'
    end
  end

end
