require 'rails_helper'

describe Follow do
  let (:test_user) {create :user}
  let (:test_follower) {create :user}

  it "should have users that have the ability to follow other users" do
    expect(test_user).to respond_to(:follow)
  end

  it "should allow users to follow other users" do
    expect{test_follower.follow(test_user)}.to change {Follow.count}.by(1)
  end

end
