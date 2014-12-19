class SnippetsController < ApplicationController

  def create
    redirect_to signin if current_user.nil?

    @user = current_user
    @snippet = @user.snippets.new(snippet_params)

    if @snippet.save
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
