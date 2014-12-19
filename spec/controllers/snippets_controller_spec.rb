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

  end
end