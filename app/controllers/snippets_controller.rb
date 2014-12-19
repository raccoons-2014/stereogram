class SnippetsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @snippet = @user.snippets.create(snippet_params)

    redirect_to snippet_path(@snippet)
  end

  private
    def snippet_params
      params.require(:snippet).permit(:track_id, :start_time, :end_time)
    end
end
