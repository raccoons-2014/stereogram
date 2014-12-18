class SnippetsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @snippet = Snippet.new(snippet_params)
    @graph = Koala::Facebook::GraphAPI.new(@user.token)
    @graph.put_wall_post(@snippet.text)
    redirect_to :back
  end

  private
    def snippet_params
      params.require(:snippet).permit(:text)
    end
end
