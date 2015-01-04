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

    it "should add a user-follower relationship to the database" do
      expect{
        post :create, follow: {followed_id: (test_user.follow(test_follower))}
      }.to change {Follow.count}.by(1)
    end

    it "should not add a user-follower relationship if invalid followed_id" do
      expect{
        post :create
      }.to_not change {Follow.count}
    end

    it "should prevent a user from following themselves" do
      expect{
        post :create, follow: {followed_id: test_user}
      }.to_not change {Follow.count}
    end
  end

  describe "#destroy" do
    it "should require a user to sign in to unfollow" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end

    xit "should add a user as a follower" do
      expect(
        post :create, follow: {followed_id: (test_user.follow(test_follower))}
      ).to be_redirect
    end
  end

end
