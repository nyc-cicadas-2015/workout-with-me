Rails.application.routes.draw do
  root 'sessions#index'

  resources :matches
  resources :activities
  resources :users
  resources :users do
    resources :matches
  end
  resources :matches do
    resources :messages
  end

  # resources :messages

  get '/session' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/ratings' => 'ratings#create'

  get '/initiate_match' => 'match#initiate_match', as: 'initiate_match'
end
