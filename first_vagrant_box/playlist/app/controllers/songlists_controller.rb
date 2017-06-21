class SonglistsController < ApplicationController
  def show
  end
  
  def create
    @song = Song.find(params[:song_id])
    @user = User.find(params[:user_id])
    @songlist = @song.songlists.create(params[:user_id], )
  end
end
