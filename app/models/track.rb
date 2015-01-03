class Track < ActiveRecord::Base
  has_many :snippets
  belongs_to :user
  has_many :votes, as: :votable
end