Rails.application.routes.draw do
  # get 'recipes/index'

  # get 'recipes/new'

  # get 'recipes/create'

  # get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  root 'recipes#index'

  # get '/hello', to: 'recipes#index'
  # get '/hello', to: 'recipes#show'
  # get '/' 
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
