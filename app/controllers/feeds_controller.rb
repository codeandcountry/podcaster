class FeedsController < ApplicationController
  def show
    @feed = Feed.includes(:episodes).find_by slug: params[:slug]
    @episodes = @feed.published_episodes

    respond_to do |format|
      format.html
      format.xml
    end

  end
end
