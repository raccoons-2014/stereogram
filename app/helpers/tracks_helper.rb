module TracksHelper
  def download_url_for(song_key)
    AWS::S3::S3Object.url_for(song_key, 'dbc-stereogram', :authenticated => false)
  end
end