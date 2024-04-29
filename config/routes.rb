Rails.application.routes.draw do
  root 'home#index'
  resources :strings, only: [:index]
  resources :ruby_tutorials, except: [:show] do
    collection do
      get :introduction
      get :global_variable
      get :instance_variable
      get :local_variable
      get :constants
    end
  end

  resources :users do
    resources :notifications do
      member do
        get :edit
        put :update
      end
      collection do
        get :index
      end
    end
  end
  resources :user_profiles, only: [:new, :create]
  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  devise_for :users
  
end
