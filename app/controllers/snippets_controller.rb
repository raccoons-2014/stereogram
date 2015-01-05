class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def create
    @user = current_user
    @snippet = @user.snippets.new(snippet_params)
    Track.find(params[:snippet][:track_id]).snippets << @snippet
    #render json: { success: true }.to_json
  end

  def destroy
    Snippet.find(params[:id]).destroy
    redirect_to root_path
  end

  private
    def snippet_params
      params.require(:snippet).permit(:track_id, :start_time, :end_time)
    end
end
