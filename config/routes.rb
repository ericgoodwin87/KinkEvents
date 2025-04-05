Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :groups do
    resources :events
    resources :messages, only: [:create]
    resources :invitations, only: [:new, :create] do
      member do
        patch :accept
      end
    end
  end
  root "groups#index"
end