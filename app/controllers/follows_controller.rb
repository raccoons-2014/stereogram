class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:follow])
    current_user.follow(@user) unless current_user.is_following?(@user) || current_user.id == @user.id
    render plain: @user.followers.count
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
