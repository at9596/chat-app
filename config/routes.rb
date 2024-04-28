Rails.application.routes.draw do
  root 'home#index'
  
  resources :user_profiles, only: [:new, :create]
  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  devise_for :users
  
end
