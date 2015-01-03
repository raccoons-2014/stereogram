class VotesController < ApplicationController


  private
    def vote_params
      params.require(:vote).permit(:snippet_id, :track_id)
    end
end
