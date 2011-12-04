Tyne::Application.routes.draw do
  resources :projects

  resources :tickets

  root :to => "tickets#index"

end
