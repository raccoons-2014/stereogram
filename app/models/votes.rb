class Votes < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
end
