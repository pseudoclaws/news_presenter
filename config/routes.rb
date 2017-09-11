Rails.application.routes.draw do
  devise_for :users
  root to: 'piece_of_news#show'

  get 'admin' => 'piece_of_news#new'

  resources :piece_of_news, only: %i[create]
  mount ActionCable.server => '/cable'
end
