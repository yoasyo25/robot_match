Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  get '/login', to: "sessions#new"

  get '/dashboard/:id', to: "users#dashboard", as: "dashboard_user"

  post '/login', to: "sessions#create"

end
