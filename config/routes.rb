Rails.application.routes.draw do
  resources :markets do
    resources :market_dates, only: [:show, :new, :edit, :create, :destroy]
  end
  resources :data_reports, only: [:index]
  resources :market_dates, only: [:index]
  get 'upload/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'upload', to: 'upload#index'
  get 'upload/results'
end
