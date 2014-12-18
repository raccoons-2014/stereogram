class SessionsController < ApplicationController
  def new
    redirect_to '/auth/facebook'
  end

  def create
    @auth = request.env["omniauth.auth"]

    user = User.where(provider: auth["provider"],uid: auth["uid"].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.user_id
    redirect_to users_show(@auth)
  end

  def failure

  end

end
