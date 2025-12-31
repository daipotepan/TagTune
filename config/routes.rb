Rails.application.routes.draw do
  devise_for :users

  resources :playlists do
    resources :songs, only: [:new, :create, :index]
    resources :playlist_songs, only: [:create]
  end

  resources :songs, except: [:new, :create]  # 単独で編集や削除は可能
  resources :playlist_songs, only: [:destroy]

  root "playlists#index"
end
