Rails.application.routes.draw do
  devise_for :users
  get 'memos/index'
  root to: "memos#index"
  resources :memos
  resources :genres
end