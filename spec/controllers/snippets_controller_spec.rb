require 'rails_helper'

describe SnippetsController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    sign_in :user, test_user
  end

  describe "#create" do
    it "creates a snippet with valid params" do
      expect{
        post :create, snippet: {
          start_time: rand(1..10).to_s,
          end_time: rand(11..50).to_s,
          track_id: test_track.id
        }
      }.to change {Snippet.count}.by(1)
    end

    it "fails for no user logged in" do
      sign_out test_user
      expect(
        post :create, snippet: {
          start_time: test_snippet.start_time,
          end_time: test_snippet.end_time,
          track_id:test_track.id
        }
      ).to be_redirect
    end

    it "fails for a snippet with invalid params" do
      expect(
        post :create, snippet: {
          user_id: nil,
          start_time: nil,
          end_time: nil,
          track_id: test_track.id
        }
      ).to be_redirect
    end

    it "associates a snippet with a track if track_id present" do
      post :create, snippet: {
        start_time: test_snippet.start_time,
        end_time: test_snippet.end_time,
        track_id: test_track.id
      }
      expect(assigns(:snippet).track).to eq(test_track)
    end

    it "fails track_id not present" do
      expect{post :create, snippet: attributes_for(:snippet)}.to raise_error
    end
  end

  describe "#destroy" do
    it "deletes a snippet from the database" do
      test_snippet
      expect{
        delete :destroy, id: test_snippet.id
      }.to change {Snippet.count}.by(-1)
    end

  end
end