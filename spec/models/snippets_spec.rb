require 'rails_helper'

describe Snippet do
  let (:test_user) {create :user}
  let (:test_track) {create :track, user: test_user}
  let (:test_snippet) {create :snippet, track: test_track}

  describe "#original_creator" do
    it "returns the user who created the track the snippet was generated from" do
      expect(test_snippet.original_creator).to be test_user
    end

  end

end