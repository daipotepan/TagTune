class SongsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @songs = current_user.songs
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      # プレイリストが選ばれていたら中間テーブル作成
      if params[:song][:playlist_id].present?
        PlaylistSong.create!(
          playlist_id: params[:song][:playlist_id],
          song: @song
        )
      end

      redirect_to songs_path, notice: "曲を追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :spotify_url,
      tag_ids: []
    )
  end
end