class AddContactInfoToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :managing_editor, :string
    add_column :feeds, :web_master, :string
  end
end
