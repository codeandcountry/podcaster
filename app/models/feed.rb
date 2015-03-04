class Feed < ActiveRecord::Base
  has_many :episodes
end
