Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  authenticate :user do
    resources :ingredients
    resources :users, only: [:index, :show]
    get 'recipes/highest_rated', to: 'recipes#highest_rated'
    resources :recipes do
      resources :ratings
      resources :photos
    end
  end
  
end
