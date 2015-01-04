class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    render 'follow_show'
  end

  def followers
    @user = User.find(params[:id])
    render 'follower_show'

  def getTracks
    @user = User.first
    @tracks = @user.tracks
    @snippets = @user.snippets
    info = {tracks: @tracks, snippets: @snippets}
    render :json => info
  end

end
