class Feed < ActiveRecord::Base
  has_many :episodes

  def published_episodes
    episodes.where('published < ? AND is_published = true', DateTime.now).all
  end
end
