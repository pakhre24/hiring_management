Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboards#index"
  resources :candidates, :employees
  resources :reports, only: [:index]
  resources :interviews do 
    member do
      get 'feedback'
      post 'submit_feedback'
    end
  end
end
