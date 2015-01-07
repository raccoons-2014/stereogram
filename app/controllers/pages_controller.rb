class PagesController < ApplicationController

  def callback
    render :callback, layout: false
  end

end
