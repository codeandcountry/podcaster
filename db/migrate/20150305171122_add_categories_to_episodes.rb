class AddCategoriesToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :categories, :string
  end
end
