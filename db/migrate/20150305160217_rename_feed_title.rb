class RenameFeedTitle < ActiveRecord::Migration
  def change
    rename_column :feeds, :name, :title
  end
end
