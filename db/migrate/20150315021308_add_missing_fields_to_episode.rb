class AddMissingFieldsToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :image, :string
    add_column :episodes, :order, :string
    add_column :episodes, :comments_url, :string
  end
end
