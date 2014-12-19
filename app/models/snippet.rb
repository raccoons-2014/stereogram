class Snippet < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  validates :user, presence: true
end
