class Song < ApplicationRecord
  belongs_to :user

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags

  validates :title, presence: true
  validates :artist, presence: true
   validates :spotify_url,
            presence: true,
            format: {
              with: /\Ahttps:\/\/open\.spotify\.com\/.+\z/,
              message: "は Spotify のURLを入力してください"
            }
end
