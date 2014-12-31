require 'rails_helper'

describe Users::OmniauthCallbacksController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  describe "#facebook" do
    it "creates a user from a facebook auth hash" do
      expect{
        post :facebook
      }.to change {User.count}.by(1)
    end
  end
end