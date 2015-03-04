class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :subtitle
      t.text :summary
      t.string :url
      t.string :length
      t.string :author
      t.string :link
      t.string :guid
      t.datetime :published
      t.string :keywords

      t.timestamps null: false
    end
  end
end
