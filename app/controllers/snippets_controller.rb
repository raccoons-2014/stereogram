class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def create
    return redirect_to signin_path if current_user.nil?

    @user = current_user
    @snippet = @user.snippets.new(snippet_params)

    if @snippet.save
      Track.find(params[:track_id]).snippets << @snippet if params[:track_id]
      redirect_to snippet_path(@snippet)
    else
      redirect_to :back
    end
  end

  private
    def snippet_params
      params.require(:snippet).permit(:track_id, :start_time, :end_time)
    end
end
