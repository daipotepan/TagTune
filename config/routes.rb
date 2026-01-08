Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :playlists do
    resources :playlist_songs, only: [:new, :create]
  end

  resources :playlist_songs, only: [:destroy]
  resources :songs

  root "home#index"
end