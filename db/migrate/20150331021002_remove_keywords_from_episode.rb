class RemoveKeywordsFromEpisode < ActiveRecord::Migration
  def up
    remove_column :episodes, :keywords
  end

  def down
    add_column :episodes, :keywords, :string
  end
end
