Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "homes#index"
  
  resources :upcoming_trips, only: [:index] do
    resources :itineraries, only: [:index]
    collection do
      get :festival_trips
      get :corporate_trips
      get :group_trips
      get :offbeat_trips 
    end
  end

  resources :traveller_stories, only: [:index]
  resources :faqs, only: [:index]
  resources :careers, only: [:index]
  resources :blogs, only: [:index]
  resources :chat_us, only: [:new, :create]

  get 'about_us', to: 'homes#about_us'
  get 'contact', to: 'homes#contact'
  get 'payment', to: 'homes#payment'
  get 'founders', to: 'homes#founders'
  get 'album', to: 'homes#album'
  get 'privacy_policy', to: 'homes#privacy_policy'
  get 'terms_and_conditions', to: 'homes#terms_and_conditions'
  get 'disclaimer', to: 'homes#disclaimer'
  get 'payment_policy', to: 'homes#payment_policy'
  get 'cancellation_policy', to: 'homes#cancellation_policy'
  get 'cancellation_policy', to: 'homes#cancellation_policy'
  get 'search', to: 'homes#search'
end
