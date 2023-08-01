Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "songs#index", as: :songs

  get "/:id", to: "songs#show", as: :song
  get "/play/:id", to: "songs#play", as: :play_song
  get "/show_new/:id", to: "songs#show_new", as: :show_song_new
  get "/edit/:id", to: "songs#edit", as: :edit_song
  get "/songs/new", to: "songs#new", as: :new_song

  # get "/edit/:id/progressions"
end
