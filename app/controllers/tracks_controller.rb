class TracksController < ApplicationController
  before_action :authenticate_user!
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

    respond_to do |format|
      format.js{
        params[:tracks].each do |key, track_data|
          track = current_user.tracks.find_or_create_by(
            source_id: track_data['id'],
            permalink_url: track_data['permalink_url'],
            artwork_url: track_data['artwork_url'],
            description: track_data['description'],
            duration: track_data['duration'],
            waveform_url: track_data['waveform_url'],
            bpm: track_data['bpm'],
            artist: track_data['user']['username'],
            title: track_data['title']
          )
        next unless track.save
      end
      render plain: 'AJAX OK'
      }

      format.html {
        @track = current_user.tracks.new(track_params)
        if @track.save
          redirect_to track_path @track
        else
          redirect_to new_track_path
        end
      }
    end
  end

  def show
    @track = Track.find params[:id]
  end

  private
    def track_params
      params.require(:track).permit(:source_id, :permalink_url, :artwork_url, :description, :duration, :waveform_url, :bpm, :title, :artist)
    end
end
