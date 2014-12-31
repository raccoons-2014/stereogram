class TracksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tracks = Track.all
    @songs = $s3.buckets.first.objects
  end

  def new
    if current_user
      @track = Track.new
    else
      redirect_to root_path
    end
  end

  def upload
    begin
        $s3.buckets.first.objects.create(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, 'dbc-stereogram', :access => :public_read)
        redirect_to tracks_path
    rescue
        render :text => "Couldn't complete the upload"
    end
  end

  def create
    params[:tracks].each do |track_data|
      track = current_user.tracks.new(track_data)
      next unless track.save
    end
    redirect_to user_path(current_user)
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
      params.require(:track).permit(:soundcloud_track_id, :user_id)
    end

    def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
    end
end
