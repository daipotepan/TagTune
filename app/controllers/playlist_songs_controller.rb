class PlaylistSongsController < ApplicationController
  before_action :authenticate_user!

  def create
    playlist = current_user.playlists.find(params[:playlist_id])
    playlist_song = PlaylistSong.joins(:playlist).where(playlists: { user_id: current_user.id }).find(params[:id])


    if playlist_song.save
      flash[:notice] = "曲を追加しました"
    else
      flash[:alert] = "その曲はすでに追加されています"
    end

    redirect_to playlist_path(playlist)
  end

  def destroy
    playlist_song = PlaylistSong.find(params[:id])

    unless playlist_song.playlist.user == current_user
      redirect_to playlists_path, alert: "権限がありません"
      return
    end

    playlist_song.destroy
    redirect_to playlist_path(playlist_song.playlist), notice: "曲を削除しました"
  end
end