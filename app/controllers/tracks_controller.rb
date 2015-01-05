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
    params[:tracks].each do |key, track_data|
      track = current_user.tracks.find_by(permalink_url: track_data['permalink_url']) or Track.create(track_data)
    end
    render plain: 'AJAX OK'
  end

  def show
    @track = Track.find params[:id]
  end

  def destroy
    if (params[:song])
      $s3.buckets.first.objects.find(params[:song], BUCKET).delete
      redirect_to root_path
    else
      render :text => "No song was found to delete!"
    end
  end

  private
    def track_params
      params.require(:track).permit(:source_id, :permalink_url, :artwork_url, :description, :duration, :waveform_url, :bpm)
    end

end
