require 'rails_helper'

describe SessionsController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  describe '#create' do
    it 'allows you to create a user' do
    expect{
      post :create
    }.to change {User.count}.by(1)
    end

    it 'returns a user already created' do
      post :create
      expect{
        post :create
      }.to_not change {User.count}
    end

  end
end