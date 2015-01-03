require 'rails_helper'

describe VotesController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

before :each do
    sign_in :user, test_user
  end

  describe "#create" do

   it "should create a new vote" do
      expect{
        post :create,
        track_id: test_track.id
      }.to change {Vote.count}.by (1)
    end

   it "should associate a vote with a track" do
      post :create, track_id: test_track.id
      expect(assigns(:vote).votable).to eq(test_track)
    end

   it "should associate a vote with a snippet" do
      post :create, snippet_id: test_snippet.id
      expect(assigns(:vote).votable).to eq(test_snippet)
    end

   it "should associate a vote with current user" do
      post :create, track_id: test_track.id
      expect(assigns(:vote).user).to eq(test_user)
    end



  end
end
