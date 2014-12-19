require 'rails_helper'

describe SnippetsController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    session[:user_id] = test_user.id
  end

  describe "#create" do
    it "creates a snippet with valid params" do
      expect{
        post :create, track_id: test_track.id, snippet: attributes_for(:snippet)
      }.to change {Snippet.count}.by(1)
    end

    it "fails for no user logged in" do
      session[:user_id] = nil
      expect(
        post :create, track_id: test_track.id, snippet: attributes_for(:snippet)
      ).to be_redirect
    end

    it "fails for a snippet with invalid params" do
      expect(
        post :create, track_id: test_track.id, snippet: {
          user_id: nil, start_time: nil, end_time: nil
        }
      ).to be_redirect
    end

    it "associates a snippet with a track if track_id present" do
      post :create, track_id: test_track.id, snippet: attributes_for(:snippet)
      expect(assigns(:snippet).track).to eq(test_track)
    end

    it "does not associate a snippet with a track if track_id not present" do
      post :create, snippet: attributes_for(:snippet)
      expect(assigns(:snippet).track).to eq(nil)
    end
  end

  describe "#destroy" do
    it "deletes a snippet from the database" do
      expect{
        post :delete, id: test_snippet.id
      }.to change {Snippet.count}.by(1)
    end

  end
end