class PlaylistSongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    ActiveRecord::Base.transaction do
      @song.save!

      PlaylistSong.create!(
        playlist: @playlist,
        song: @song
      )
    end

    redirect_to @playlist, notice: "曲を追加しました"

  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "曲を追加できませんでした"
    render :new
  end
  private

  def set_playlist
    @playlist = current_user.playlists.find(params[:playlist_id])
  end

  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :spotify_url,
      tag_ids: []
    )
  end
end