Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  root 'sessions#new'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/dashboard/:id', to: "users#dashboard", as: "dashboard_user"

  delete '/logout', to: "sessions#destroy"
  resources :conversations do
    resources :messages
  end
end
