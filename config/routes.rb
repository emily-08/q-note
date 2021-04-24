Rails.application.routes.draw do
  devise_for :users
  get 'memos/index'
  root to: "genres#index"
  resources :genres do
    resources :memos do
      collection do
        get 'search'
      end
    end
  end
end