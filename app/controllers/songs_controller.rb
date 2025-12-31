class SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = current_user.songs
  end

  def show
  end

  def new
    @song = current_user.songs.build
  end

  def create
    @song = current_user.songs.build(song_params)

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
    @song = current_user.songs.find(params[:id])
  end

  def song_params
    params.require(:song)
          .permit(:title, :artist, :spotify_url, tag_ids: [])
  end
end