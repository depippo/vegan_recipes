Rails.application.routes.draw do
  resources :ingredients
  resources :recipes do
    resources :ratings
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end
end
