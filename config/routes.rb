Rails.application.routes.draw do
  # Página raíz
  root 'home#index'
  
  # Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  # Recursos para usuarios
  resources :users, only: [:show, :edit, :update]

  # Ruta personalizada para el dashboard de usuarios
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  # Encuestas y respuestas
  resources :surveys do
    resources :responses, only: [:new, :create, :index, :show]
  end

  # Propuestas
  resources :propuestas, only: [:index, :create]
  resources :proposals, only: [:create]

  # Recomendaciones
  resources :recommendations, only: [:index]

  # Estadísticas
  resources :user_statistics, only: [] do
    collection do
      get :personalized
      get :recommendations
    end
  end

  namespace :admin do
    resources :statistics, only: [] do
      collection do
        get :general
      end
    end
  end
end