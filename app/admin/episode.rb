ActiveAdmin.register Episode do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :title, :subtitle, :summary, :url, :length, :author, :link, :guid, :published, :keywords, :feed_id, :categories

  index do
    id_column
    column :title
    column :published
    column :feed_title
    actions
  end
end
