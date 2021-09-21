Rails.application.routes.draw do
  resources :event_attendances, only: %i[create destroy]
  resources :event_invitations, only: %i[new create destroy]
  resources :events
  devise_for :users
  resources :users, only: [:show]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
