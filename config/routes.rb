Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  get "references/index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#login', as: :login
  get '/logout', to: 'sessions#destroy'
  get 'contact', to: 'pages#contact'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'my_page' => 'users#my_page'

  root 'tops#top'

  resources :noshis, only: %i[index show] do
    resource :noshi_bookmark, only: %i[create show destroy]
    collection do
      get :bookmarks, to: 'noshi_bookmarks#show'
      get :require_login, to: 'noshi_bookmarks#require_login'
    end
  end

  resources :columns, only: %i[index show] do
    resource :column_bookmark, only: %i[create show destroy]
    collection do
      get :bookmarks, to: 'column_bookmarks#show'
      get :require_login, to: 'column_bookmarks#require_login'
    end
  end

  post 'users/firebase_login', to: 'users/sessions#firebase'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
    resources :columns, only: %i[new create index show edit update destroy]
    root "tops#top"
  end

  resources :references, only: %i[index]

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match "*path", to: "errors#not_found", via: :all
end
