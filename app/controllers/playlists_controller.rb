class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @playlists = current_user.playlists
    else
      @playlists = []
    end
  end

  def show
  end

  def new
    @playlist = current_user.playlists.build
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)

    if @playlist.save
      redirect_to @playlist, notice: "プレイリストを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: "プレイリストを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path, notice: "プレイリストを削除しました"
  end

  private

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :description)
  end
end
