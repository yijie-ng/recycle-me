Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items do
    resources :exchanges, only: [:create]
  end
  resources :exchanges, only: [:index, :update] do
    member do
      post 'approve'
    end
    member do
      post 'complete'
    end
  end
end
