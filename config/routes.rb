Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "songs#index"

  get "/:id", to: "songs#show"
  get "/play/:id", to: "songs#play"
  get "/show_new/:id", to: "songs#show_new"
end
