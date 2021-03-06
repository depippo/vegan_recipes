Rails.application.routes.draw do
  resources :comments
  root 'recipes#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  authenticate :user do
    resources :nutrients, only: [:index, :show]
    resources :ingredients, only: [:index, :show, :new, :create, :edit, :update]
    resources :users, only: [:index, :show]
    get 'recipes/highest_rated', to: 'recipes#highest_rated'
    get '/users/:id/data', to: 'users#data'
    get '/ingredients/:id/data', to: 'ingredients#data'
    resources :recipes do
      resources :comments
      resources :ratings, only: [:new, :create]
      resources :photos, only: [:index, :new, :create]
      put :favorite, on: :member
    end
  end
  
end
