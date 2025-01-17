Rails.application.routes.draw do
    # devise_for :admins
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
    }

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

    resources :songs do
      resources :progression_templates, only: [ :index ]
      resources :progressions, only: [ :index ]
      resources :user_favorites, only: [ :new ]
    end

    resources :song_filters, only: [ :create ]
    resources :song_searches, only: [ :create ]

    resources :progressions do
        resources :sequence_adjustments, only: [ :new ], controller: :progression_sequence_adjustments
    end

    resources :hints, only: [:index]

    resources :references, only: [:index]
    resource :references, only: [:index] do
        resources :chords, only: [:index]
    end
    resources :key_references, only: [:index]
    resources :progression_template_references, only: [:index]
    resources :progression_references, only: [:index]

    resources :instrument_views, only: [:create]

    resources :user_instruments

    resources :publications, only: [:index]

    resources :inquiries, only: [:index, :create]

    resources :setlists do
        resources :sequence_adjustments, only: [ :new ], controller: :setlist_sequence_adjustments
    end
    resources :setlist_songs, only: [:new, :create]

    resources :statistics, only: [ :index ]

    resources :header_links, only: [ :index ]

    resources :subscriptions, only: [ :new, :destroy, :update ]

    resources :artists, only: [ :index, :edit, :update ]
    resources :artist_links, only: [ :new, :create, :edit, :update, :destroy ]

    # webhooks are always POST request, so only need create action
    resources :webhooks, only: [:create]

    root "application#index"
end
