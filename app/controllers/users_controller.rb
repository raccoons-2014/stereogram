class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    render 'follow_show'
  end

  def followers
    @user = User.find(params[:id])
    render 'follower_show'
  end


end
