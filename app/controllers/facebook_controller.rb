class FacebookController < ApplicationController
  include FacebookHelper

  def post_to_facebook
    item_to_share = params[:track_id].nil? ? Snippet.find(params[:snippet_id]) : Track.find(params[:track_id])
    share({token: current_user.token, item: item_to_share })
    render nothing: true
  end

end