class ChangeEpisodeImageToAttachment < ActiveRecord::Migration
  def change
    rename_column :episodes, :image, :remote_image_url
    add_attachment :episodes, :image
  end
end
