class AddSubcategoryToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :subcategory, :string
  end
end
