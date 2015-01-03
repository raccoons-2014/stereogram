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

  end
end
