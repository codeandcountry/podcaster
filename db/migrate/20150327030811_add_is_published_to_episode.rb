class AddIsPublishedToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :is_published, :boolean
  end
end
