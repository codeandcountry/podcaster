class FeedsController < ApplicationController
  def show
    @feed = Feed.includes(:episodes).find_by slug: params[:slug]
    @episodes = @feed.published_episodes

    respond_to do |format|
      format.html
      format.xml
      format.json { render json: @feed }
    end

  end

  def meta
    @feed = Feed.find(params[:id])
    respond_to do |format|
      format.json { render json: @feed, :only=>  [:id, :image_url, :image_title, :image_width, :image_height, :image_link, :categories, :author, :language] }
    end
  end
end
