class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:follow])
    current_user.follow(@user) unless current_user.is_following?(@user) || current_user.id == @user.id
    render plain: @user.followers.count
  end

  def destroy
    @user = User.find(params[:id])
    current_user.follows.find_by(followed_id: params[:id]).destroy
    render plain: @user.followers.count
  end
end
