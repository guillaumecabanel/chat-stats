Rails.application.routes.draw do
  resources :chats, only: [:new, :create, :show]
end
