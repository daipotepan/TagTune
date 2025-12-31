class SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_playlist, only: [:new, :create]

  def index
    @playlists = current_user.playlists.includes(:songs)
  end

  def show
  end

  def new
    @song = @playlist.songs.build
  end

  def create
    @song = @playlist.songs.build(song_params)

    if @song.save
      redirect_to @song, notice: "曲を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "曲を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path, notice: "曲を削除しました"
  end

  private

  def set_song
    @song = Song.find(params[:id])
    if @song.playlist.user != current_user
      redirect_to songs_path, alert: "アクセスできません"
    end
  end

  def set_playlist
    @playlist = current_user.playlists.find(params[:playlist_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to playlists_path, alert: "プレイリストが見つかりません"
  end

  def song_params
    params.require(:song).permit(:title, :artist, :spotify_url, tag_ids: [])
  end
end