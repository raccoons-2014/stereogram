class UsersController < ApplicationController
  def index

  end

  def create
    @graph = Koala::Facebook::GraphAPI.new()
  end

  def show
    @user = User.find(session[:user_id])
  end
end
