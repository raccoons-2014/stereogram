class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def create
    @user = current_user

    respond_to do |format|
      format.js {
        binding.pry
        @snippet = @user.snippets.new(snippet_params)
        Track.find_by(source_id: params[:snippet][:track][:source_id]).snippets << @snippet
        render plain: 'OK'
      }

      format.html {
        @snippet = @user.snippets.new(snippet_params)
        if @snippet.save
          Track.find(params[:track_id]).snippets << @snippet if params[:track_id]
          redirect_to snippet_path(@snippet)
        else
          redirect_to :back
        end
      }
    end
  end

  def destroy
    snippet = Snippet.find(params[:id])
    snippet.destroy
    redirect_to root_path
  end

  private
    def snippet_params
      params.require(:snippet).permit(:track_id, :start_time, :end_time)
    end
end
