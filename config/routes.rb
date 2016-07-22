Rails.application.routes.draw do
  resources :ingredients
  resources :recipes do
    resources :ratings
  end
  devise_for :users
end
