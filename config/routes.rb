Rails.application.routes.draw do
  get 'user/profile'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root 'recipes#index'
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
