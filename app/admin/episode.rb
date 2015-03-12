ActiveAdmin.register Episode do

  permit_params :title, :subtitle, :summary, :url, :length, :author, :link, :guid, :published, :keywords, :feed_id, :categories, :mp3

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
      f.input :mp3, :as => :file
    end

    #binding.pry
    if f.object.mp3_file_name
      f.inputs "Details" do
        f.input :title
        f.input :subtitle
        f.input :summary 
        f.input :published
        f.input :guid
        f.input :length
      end

      f.inputs "Metadata" do
        f.input :author 
        f.input :link
        f.input :keywords
        f.input :categories
      end
    end

    f.actions
  end
end
