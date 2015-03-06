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

    f.inputs "Details" do
      f.input :title
      f.input :subtitle
      f.input :summary 
      f.input :published
      f.input :guid
    end

    f.inputs "Metadata" do
      f.input :author 
      f.input :link
      f.input :keywords
      f.input :categories
    end

    f.inputs "File" do
      f.input :length
      f.input :mp3, :as => :file
    end
    f.actions
  end
end
