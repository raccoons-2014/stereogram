require 'rails_helper'

describe TracksController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    sign_in :user, test_user
  end

  describe "#create" do
    it "should save new Track instance to the database with valid params" do
      expect{
        post :create, track: attributes_for(:track)
      }.to change {Track.count}.by(1)
    end

  describe "#create" do
    it "fails for no user logged in" do
      session[:user_id] = nil
        expect(
          post :create, user_id: test_user.id, track: attributes_for(:track)
        ).to be_redirect
      end
    end
  end
end
