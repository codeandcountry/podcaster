class AddFtpLocationToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :ftp_folder_path, :string
    add_column :feeds, :ftp_folder_url, :string
  end
end
