class SongsController < ApplicationController
  def index
    @all_songs = Song.all
  end

  def create
    @song = Song.new song_params
    @song.user = current_user
    unless @song.save
      flash[:errors]= @song.errors.full_messages
    end
    redirect_to 'songs'
  end

  def show
    @user = current_user
    @song = Song.includes(:user, :songlist_users).find(params[:song_id])
    # @songlist = Songlist.all.where.not(user_id: current_user)
  end

  def add
    @song = Song.find(params[:song_id])
    @song.songlist_users << current_user
    redirect_to '/songs'
  end

  private
    def song_params
      params.require(:song).permit(:artist, :title)
    end
end
