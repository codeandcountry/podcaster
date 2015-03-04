class AddFeedIdToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :feed_id, :integer
    add_index  :episodes, :feed_id
  end
end
