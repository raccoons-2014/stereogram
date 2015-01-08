class VotesController < ApplicationController

  def create
    user = current_user
    @vote = user.votes.new

    votable = params[:track_id].nil? ? Snippet.find(params[:snippet_id]) : Track.find(params[:track_id])
    votable.votes << @vote unless votable.already_voted?(current_user)
      render partial: "votes/vote", locals: {votable: votable}
  end


  private
    def vote_params
      params.require(:vote).permit(:snippet_id, :track_id)
    end
end
