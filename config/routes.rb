Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :admins
  resources :users, only: [:show, :edit, :update]
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  resources :surveys do
    resources :responses, only: [:new, :create]
  end
  

  # Rutas para estadísticas
  get 'user_statistics/personalized', to: 'user_statistics#personalized'
  get 'user_statistics/recommendations', to: 'user_statistics#recommendations'
  get 'admin_statistics/general', to: 'admin_statistics#general'

  # Rutas para sesiones (si no usas Devise)
  resources :sessions, only: %i[new create destroy]
end
