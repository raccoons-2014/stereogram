class SnippetsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @snippet = @user.snippets.create(snippet_params)

    @graph = Koala::Facebook::GraphAPI.new(@user.token)
    @graph.put_wall_post(@snippet)
    redirect_to :back
  end

  private
    def snippet_params
      params.require(:snippet).permit(:track_id, :start_time, :end_time)
    end
end
