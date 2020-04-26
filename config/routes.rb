Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    namespace :staff do
      root "top#index"
      get "login" => "sessions#new", as: :login
      post "session" => "sessions#create", as: :session
      delete "session" => "sessions#destroy"
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin do
      root "top#index"
      get "login" => "sessions#new", as: :login
      post "session" => "sessions#create", as: :session
      delete "session" => "sessions#destroy"
    end
  end

  namespace :customer do
    root "top#index"
  end
end
