class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def new
    # if current_user
      @track = Track.new
    # else
    #   redirect_to root_path
    # end
  end

  def create
    @track = Track.new track_params
    @track.user_id = current_user.id

    if @track.save

      p "*" * 50
      p @track
      p current_user
      p @track.user_id
      p "*" * 50

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
      params.require(:track).permit(:soundcloud_url, :user_id)
    end
end
