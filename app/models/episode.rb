class Episode < ActiveRecord::Base
  belongs_to :feed

  def url
    if feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/#{read_attribute(:url)}"
    else
      read_attribute(:url)
    end
  end
end
