ActiveAdmin.register Episode do

  permit_params :title, :subtitle, :summary, :url, :length, :author, :link, :is_published, :published, :published_date, :published_time_hour, :published_time_minute, :feed_id, :categories, :mp3, :image, :remote_image_url, :order, :comments_url

  index do
    id_column
    column :title
    column :published
    column :feed_title
    actions
  end

  form do |f|
    f.inputs "Feed" do  
      f.input :feed
    end

    f.inputs "File" do
      f.input :mp3, :as => :file, :hint => f.object.audio_player
    end

    #binding.pry
    if f.object.mp3_file_name
      f.inputs "Details" do
        f.input :title
        f.input :subtitle
        f.input :summary 
        f.input :is_published, :as => :toggle
        f.input :published, :as => :just_datetime_picker
        f.input :length
      end

      f.inputs "Image" do
        f.input :image, :as => :file, :hint => image_tag(f.object.image_url) 
        f.input :remote_image_url
      end

      f.inputs "Metadata" do
        f.input :author 
        f.input :link
        f.input :categories
        f.input :order
        f.input :comments_url
      end
    end

    f.actions
  end
end
