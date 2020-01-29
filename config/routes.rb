Rails.application.routes.draw do
  root to: 'chats#new'
  resources :chats, only: [:new, :create, :show, :destroy]
end
