require 'rails_helper'

describe FollowsController do
  let (:test_user) {create :user}
  let (:test_follower) {create :user}

  describe "#create" do
    it "should add a user as a follower" do
      expect(
        post :create, follow: {followed_id: (test_user.follow(test_follower))}
      ).to be_redirect
    end

    it "should add a user follower relationship to the database" do
      expect{
        post :create, follow: {followed_id: (test_user.follow(test_follower))}
      }.to change {Follow.count}.by(1)
    end

    it "should prevent a user from following themselves" do
      current_user = test_user
      expect{
        post :create, follow: {followed_id: test_user}
      }.to_not change {Follow.count}
    end

  end
end
