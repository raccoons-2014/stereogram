class TracksController < ApplicationController
  def new
    @track = Track.new
  end

  def create
    # if current_user
      @track = user.tracks.create track_params

  end

  private
    def track_params
      params.require(:track).permit(:soundcloud_url, :user_id)
    end
end
