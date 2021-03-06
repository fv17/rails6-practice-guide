Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    namespace :staff do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [:create, :destroy]
      resource :account, only: [:show, :edit, :update]
      resource :password, only: [:show, :edit, :update]
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [:create, :destroy]
      resources :staff_members do
        resources :staff_events, only: [:index]
      end
      resources :staff_events, only: [:index]
    end
  end

  namespace :customer do
    root "top#index"
  end
end
