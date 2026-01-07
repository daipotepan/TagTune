class PlaylistSongsController < ApplicationController
  before_action :authenticate_user!

  def create
    playlist = current_user.playlists.find(params[:playlist_id])
    song = Song.find(params[:song_id])

    playlist_song = PlaylistSong.new(playlist: playlist, song: song)

    if playlist_song.save
      redirect_to playlist_path(playlist), notice: "曲を追加しました"
    else
      redirect_to playlist_path(playlist), alert: "その曲はすでに追加されています"
    end
  end

  def destroy
    playlist_song = PlaylistSong.find(params[:id])

    if playlist_song.playlist.user != current_user
      redirect_to playlists_path, alert: "権限がありません"
      return
    end

    playlist_song.destroy
    redirect_to playlist_path(playlist_song.playlist), notice: "曲を削除しました"
  end
end