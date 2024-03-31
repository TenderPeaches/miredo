Rails.application.routes.draw do
  # devise_for :admins
  devise_for :users

  resources :songs do
    resources :progressions, only: [ :index ]
    resources :song_progressions, only: [ :index ]
  end

  resources :song_plays, only: [ :new, :create ]

  resources :progressions, except: [ :index, :show ]

  resources :progression_chords, except: [ :index, :show ]

  resources :song_progressions

  resources :scales, only: [ :index ]

  resources :progression_chord_shifts, only: [:new]

  post 'new_song_progression_form', to: "song_progressions#new", as: :new_song_progression_form

  root "songs#index"
end
