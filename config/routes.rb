Rails.application.routes.draw do
    # devise_for :admins
    devise_for :users

    resources :users do
        resources :songs, only: [ :index ], controller: :user_songs
    end

    namespace :user do
        resources :settings, only: [:index, :update]
    end

    resources :song_plays, only: [ :new, :create ]

    resources :progression_templates, except: [ :show, :index ]

    resources :progressions, except: [ :show, :index ]

    resources :scales, only: [ :index ]

    resources :progression_chord_shifts, only: [:new]

    resources :songs do
      resources :progression_templates, only: [ :index ]
      resources :progressions, only: [ :index ]
      resources :user_favorites, only: [ :new ]
    end

    resources :song_filters, only: [ :create ]

    resources :progressions do
        resources :sequence_adjustments, only: [ :new ], controller: :progression_sequence_adjustments
    end

    resources :hints, only: [:index]

    resources :references, only: [:index]
    resource :references, only: [:index] do
        resources :chords, only: [:index]
    end

    resources :instrument_views, only: [:create]

    resources :user_instruments

    resources :publications, only: [:index]

    resources :inquiries, only: [:index]

    root "application#index"
end
