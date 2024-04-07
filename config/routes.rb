Rails.application.routes.draw do
  # devise_for :admins
  devise_for :users


  resources :song_plays, only: [ :new, :create ]

  resources :progression_templates, except: [ :show, :index ]

  resources :progression_chords, except: [ :index, :show ]

  resources :progressions, except: [ :show, :index ]

  resources :scales, only: [ :index ]

  resources :progression_chord_shifts, only: [:new]

  resources :songs do
    resources :progression_templates, only: [ :index ]
    resources :progressions, only: [ :index ]
  end

  root "songs#index"
end
