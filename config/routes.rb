Rails.application.routes.draw do
  root to: 'pages#welcome'
  resources :chats, only: [:new, :create, :show]
end
