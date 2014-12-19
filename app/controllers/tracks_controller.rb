class TracksController < ApplicationController
  before_action :redirect_guests
  def index
    @tracks = Track.all
  end

  def new
    if current_user
      @track = Track.new
    else
      redirect_to root_path
    end
  end

  def create
    @track = current_user.tracks.new(track_params)

    if @track.save
      redirect_to track_path @track
    else
      redirect_to new_track_path
    end
  end

  def show
    @track = Track.find params[:id]
  end

  def destroy
    @track = Track.find params[:id]
    @track.destroy
    redirect_to root_path
  end

  private
    def track_params
      params.require(:track).permit(:soundcloud_track_id, :user_id)
    end
end
