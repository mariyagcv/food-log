Rails.application.routes.draw do
  # creates seven different routes in the application - GET, POST, PUT, PATCH, DELETE ... 
  # exist by default without specifying each one here in the routes
  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "entries#index"
  get "/entries", to: "logs#index"
end
