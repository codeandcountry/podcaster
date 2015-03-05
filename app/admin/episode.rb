ActiveAdmin.register Episode do

  permit_params :title, :subtitle, :summary, :url, :length, :author, :link, :guid, :published, :keywords, :feed_id, :categories

  index do
    id_column
    column :title
    column :published
    column :feed_title
    actions
  end
end
