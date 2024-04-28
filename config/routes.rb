Rails.application.routes.draw do
  
  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  root 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
