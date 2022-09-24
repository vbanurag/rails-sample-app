Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :products, only: [:show, :create, :index]
      resources :users, only: [:show]
      resources :auth

      post "auth/login" => "auth#login"
      post 'users/signup' => 'users#signup'

    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
