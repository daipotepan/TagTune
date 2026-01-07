Rails.application.routes.draw do
  devise_for :users

  resources :songs
  resources :playlists do
    resources :playlist_songs, only: [:create]
  end
  resources :playlist_songs, only: [:destroy]

  root "home#index"
end