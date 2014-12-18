class UsersController < ApplicationController
  def index

  end

  def create
    @user = User.find(session[:user_id])
    @graph = Koala::Facebook::GraphAPI.new(@user.token)
    @graph.put_wall_post("")
  end

  def show
    @user = User.find(session[:user_id])
  end
end
