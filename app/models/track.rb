class Track < ActiveRecord::Base
  has_many :snippets
  belongs_to :user
  has_many :votes, as: :votable

  def score
    self.votes.size
  end

  def voters
    self.votes.includes(:user).map(&:user)
  end

  def already_voted?(user)
    self.voters.include?(user)
  end
end