class RemoveBuiltTimeFromFeed < ActiveRecord::Migration
  def up
    remove_column :feeds, :last_build_date
  end

  def down
    add_column :feeds, :last_build_date, :datetime
  end
end
