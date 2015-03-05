class Feed < ActiveRecord::Base
  has_many :episodes

  def published_episodes
    episodes.where('published < ?', DateTime.now).all
  end
end
