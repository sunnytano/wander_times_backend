Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :likes
      resources :reviews
      resources :articles
      resources :users

      # post '/login', to: 'auth#create'
      # get '/auth', to: 'auth#persist'
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
    
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end 
end 