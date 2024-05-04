namespace :admin do
    resources :access_logs, only: [:index]
    resources :reports, only: [:index] do
      collection do
        get :generate_pdf
        get :details_generate_pdf
        get :generate_excel, defaults: { format: :xlsx }
      end
    end
  end