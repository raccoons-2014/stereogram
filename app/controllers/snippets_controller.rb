class SnippetsController < ApplicationController
  include FacebookHelper
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
  end

  def following
    @snippets = []
    current_user.following.each do |followed|
      @snippets.push(followed.snippets.most_recent.limit(3))
    end
    @snippets.flatten!
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def create
    @user = current_user

    respond_to do |format|
      format.js {
        @snippet = @user.snippets.new(snippet_params)
        Track.find(params[:snippet][:track_id]).snippets << @snippet
        render plain: 'This will be a snippet partial'
      }

      format.html {
        @snippet = @user.snippets.new(snippet_params)
        if Track.find(params[:track_id]).snippets << @snippet
          redirect_to snippet_path(@snippet)
        else
          redirect_to :back
        end
      }
      share({token: current_user.token}) if Rails.env.production?
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
