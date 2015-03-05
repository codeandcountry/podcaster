class AddFeedFields < ActiveRecord::Migration
  def change
    add_column :feeds, :atom_link, :string
    add_column :feeds, :link, :string
    add_column :feeds, :subtitle, :string
    add_column :feeds, :summary, :string
    add_column :feeds, :language, :string
    add_column :feeds, :copyright, :string
    add_column :feeds, :owner_name, :string
    add_column :feeds, :owner_email, :string

    add_column :feeds, :last_build_date, :datetime
    add_column :feeds, :published_date, :datetime
    add_column :feeds, :ttl, :string
    add_column :feeds, :skip_days, :string

    add_column :feeds, :generator, :string
    add_column :feeds, :docs, :string
    add_column :feeds, :author, :string

    add_column :feeds, :image_url, :string
    add_column :feeds, :image_title, :string
    add_column :feeds, :image_width, :string
    add_column :feeds, :image_height, :string
    add_column :feeds, :image_link, :string

    add_column :feeds, :is_explicit, :boolean

    add_column :feeds, :categories, :string
  end
end