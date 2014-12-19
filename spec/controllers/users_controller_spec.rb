require 'rails_helper'

describe UsersController do
  let (:test_user) {create :user}
  let (:test_track) {create :track}
  let (:test_snippet) {create :snippet}

  before :each do
    session[:user_id] = test_user.id
  end

  describe "#show" do
    it "sets @user to current_user" do
      get :show, id: test_user.id
      expect(assigns(:user)).to eq(test_user)
    end
  end
end