Rails.application.routes.draw do
  root 'home#index'  # Define the root route

  devise_for :users
  devise_for :admins

  resources :admins
  resources :users, only: [:show, :edit, :update]
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  resources :surveys do
    resources :responses, only: [:new, :create, :index, :show]
  end

  resources :recommendations, only: [:index]   
  resources :statistics, only: [:index]
  get 'user_statistics/personalized', to: 'user_statistics#personalized'
  get 'user_statistics/recommendations', to: 'user_statistics#recommendations'
  get 'admin_statistics/general', to: 'admin_statistics#general'
end