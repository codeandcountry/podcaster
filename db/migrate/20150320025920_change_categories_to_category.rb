class ChangeCategoriesToCategory < ActiveRecord::Migration
  def change
    rename_column :feeds, :categories, :category
  end
end
