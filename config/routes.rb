Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'capture/:id', to: 'pokemons#capture', as: 'capture'
  patch 'damage/:id', to: 'pokemons#damage', as: 'damage'
  post 'create', to: 'pokemons#create'
  get 'new', to: 'pokemons#new', as: 'new_pokemon'
end