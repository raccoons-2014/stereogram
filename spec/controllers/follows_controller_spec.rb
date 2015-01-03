require 'rails_helper'

describe FollowsController do
  let (:test_user) {create :user}
  let (:test_follower) {create :user}

  before :each do
    sign_in :user, test_user
  end

end
