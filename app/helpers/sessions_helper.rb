module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def redirect_guests
    redirect_to signin_path if current_user.nil?
  end
end
