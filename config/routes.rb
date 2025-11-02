Rails.application.routes.draw do
  get "google_auth/callback"
  get "references/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'my_page' => 'users#my_page'

  # Defines the root path route ("/")
  # root "posts#index"
  root 'tops#top'

  resources :noshis, only: %i[index show] do
    resource :noshi_bookmarks, only: %i[create show destroy]
    collection do
      get :bookmarks, to: 'noshi_bookmarks#show'
      get :require_login, to: 'noshi_bookmarks#require_login'
    end
  end

  resources :columns, only: %i[index show] do
    resource :column_bookmarks, only: %i[create show destroy]
    collection do
      get :bookmarks, to: 'column_bookmarks#show'
      get :require_login, to: 'column_bookmarks#require_login'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get '/admin/login' => "admin/sessions#new", :as => :admin_login
    post '/admin/login' => "admin/sessions#create"
    delete '/admin/logout' => "admin/sessions#destroy", :as => :admin_logout
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
    resources :columns, only: %i[new create index show edit update destroy]
    root "tops#top"
  end

  resources :references, only: %i[index]
  get '/oauth2callback', to: 'google_auth#callback'
end
