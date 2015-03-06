class AddMp3ToEpisode < ActiveRecord::Migration
  def change
    add_attachment :episodes, :mp3
  end
end
