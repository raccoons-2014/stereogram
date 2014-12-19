class SessionsController < ApplicationController
  def new
    session[:fb_permissions] = 'publish_actions'
    redirect_to '/auth/facebook'
  end

  def create
    @auth = request.env["omniauth.auth"]
    @user = User.where(provider: @auth["provider"],uid: @auth["uid"].to_s).first || User.create_with_omniauth(@auth)
    reset_session
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def failure

  end

end
