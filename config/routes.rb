Rails.application.routes.draw do
  devise_for :users, controllers: { 
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end
  devise_scope :user do
    root to: "users/sessions#new"
  end
  resources :comics
  resources :categories
  resources :publishers
  resources :authors
  resources :author_jobs
end
