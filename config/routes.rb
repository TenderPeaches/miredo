Rails.application.routes.draw do

  resources :songs do
    member do
      get 'define_progressions', to: "songs#define_progressions"
    end
  end

  resources :progressions

  root "songs#index"

  get "scale", to: "scales#get", as: :scale
  get "scales", to: "songs#scales", as: :scales

  #get "/:id", to: "songs#show", as: :song
  #get "/play/:id", to: "songs#play", as: :play_song
  #get "/show_new/:id", to: "songs#show_new", as: :show_song_new
  #get "/edit/:id", to: "songs#edit", as: :edit_song
  #get "/songs/new", to: "songs#new", as: :new_song
  #post "/songs", to: "songs#create", as: :songs

  # get "/edit/:id/progressions"
end
