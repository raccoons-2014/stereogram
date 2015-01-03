module VotesHelper

  def already_voted?(post)
    post.voters.include?(current_user)
  end

end
