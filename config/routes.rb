Rails.application.routes.draw do
  devise_for :users
  root "prototypes#index"

  # resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # resources :prototypes
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show

end
