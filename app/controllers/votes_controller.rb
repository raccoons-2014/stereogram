class VotesController < ApplicationController

  def create
    user = current_user
    @vote = user.votes.new

    if params[:track_id]
      @track = Track.find(params[:track_id])
      @track.votes << @vote unless already_voted?(@track)
      redirect_to :back
    else
      @snippet = Snippet.find(params[:snippet_id])
      @snippet.votes << @vote unless already_voted?(@snippet)
      redirect_to :back
    end
  end


  private
    def vote_params
      params.require(:vote).permit(:snippet_id, :track_id)
    end
end
