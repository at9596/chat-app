namespace :admin do
    resources :reports, only: [:index] do
      collection do
        get :generate_pdf
        get :details_generate_pdf
      end
    end
  end