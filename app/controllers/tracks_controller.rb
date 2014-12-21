class TracksController < ApplicationController
  include TracksHelper
  before_action :redirect_guests
  def index
    @tracks = Track.all
    @songs = AWS::S3::Bucket.find('dbc-stereogram').objects
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
        AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, 'dbc-stereogram', :access => :public_read)
        redirect_to tracks_path
    rescue
        render :text => "Couldn't complete the upload"
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

    def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
    end
end
