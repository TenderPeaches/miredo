Rails.application.routes.draw do

  resources :songs do
    member do
      get 'define_progressions', to: "songs#define_progressions"
    end
  end

  resources :progressions, :progression_chords

  root "songs#index"

  get "scale", to: "scales#get", as: :scale
  get "scales", to: "songs#scales", as: :scales

  get "utils/print_progression_chord", to: "progression_chords#print_from_request"
  get "utils/get_degrees", to: "scales#get_degree_chords_from_request"
  get "utils/get_progression_chord_generator_info", to: "progression_chords#generator_info"

  #get "/:id", to: "songs#show", as: :song
  #get "/play/:id", to: "songs#play", as: :play_song
  #get "/show_new/:id", to: "songs#show_new", as: :show_song_new
  #get "/edit/:id", to: "songs#edit", as: :edit_song
  #get "/songs/new", to: "songs#new", as: :new_song
  #post "/songs", to: "songs#create", as: :songs

  # get "/edit/:id/progressions"
end
