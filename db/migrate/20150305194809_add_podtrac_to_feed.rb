class AddPodtracToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :uses_podtrac, :boolean
  end
end
