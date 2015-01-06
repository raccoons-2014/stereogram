class Track < ActiveRecord::Base
  has_many :snippets
  belongs_to :user
  has_many :votes, as: :votable

  def string_duration
    total_seconds = self.duration.to_f/1000
    minutes = (total_seconds/60).to_i
    seconds = total_seconds.to_i % minutes
    "#{minutes} m #{seconds} s"
  end

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