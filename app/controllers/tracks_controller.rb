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
    tracks = []
    params[:tracks].each do |key, track_data|
      track = current_user.tracks.find_or_create_by(
      source_id: track_data['id'],
      permalink_url: track_data['permalink_url'],
      artwork_url: track_data['artwork_url'],
      description: track_data['description'],
      duration: track_data['duration'],
      waveform_url: track_data['waveform_url'],
      bpm: track_data['bpm']
      )
      next unless track.save
      tracks << track
    end
    render partial: "tracks/updated_show", locals: {tracks: tracks}
  end

  def show
    @track = Track.find params[:id]
  end

  private
    def track_params
      params.require(:track).permit(:source_id, :permalink_url, :artwork_url, :description, :duration, :waveform_url, :bpm)
    end
end
