Rails.application.routes.draw do
  root 'recipes#index'
  authenticate :user do
    resources :ingredients
    resources :recipes do
      resources :ratings
      resources :photos
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
resources :users, only: [:index, :show]
end
