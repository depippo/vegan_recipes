Rails.application.routes.draw do
  resources :nutrient_ingredients
  resources :nutrients
  root 'recipes#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  authenticate :user do
    resources :ingredients, only: [:index, :show, :new, :create, :edit, :update]
    resources :users, only: [:index, :show]
    get 'recipes/highest_rated', to: 'recipes#highest_rated'
    resources :recipes do
      resources :ratings, only: [:new, :create]
      resources :photos, only: [:index, :new, :create]
    end
  end
  
end
