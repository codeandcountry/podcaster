class ChangeFeedSummaryToText < ActiveRecord::Migration
  def change
    change_column :feeds, :summary, :text
  end
end
