class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps null: false
    end
    add_index :feeds, :slug, unique: true
  end
end
