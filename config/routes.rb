Tyne::Application.routes.draw do
  resources :projects

  resources :tickets do
    resources :comments
  end

  root :to => "tickets#index"

  get '/login', :to => 'sessions#new', :as => :login
  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/auth/failure" => "sessions#failure", :as => :failure
  match "/logout" => "sessions#destroy", :as => :logout
end
