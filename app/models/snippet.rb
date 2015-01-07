class Snippet < ActiveRecord::Base
  scope :most_recent, -> { order(created_at: :desc) }
  
  belongs_to :track
  belongs_to :user

  has_many :votes, as: :votable

  validates :user, presence: true
  validates :start_time, :end_time, presence: true

  def original_creator
    self.track.user
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
