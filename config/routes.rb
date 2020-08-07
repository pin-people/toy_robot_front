Rails.application.routes.draw do
  root 'game#index'
  resources :game, only: [:index]
  put '/game', to: 'game#update', as: :game
end
