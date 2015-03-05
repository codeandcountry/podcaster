ActiveAdmin.register Feed do


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


  permit_params :title, :description, :slug, :atom_link, :link, :subtitle, :summary, :language, :copyright, :owner_name, :owner_email, :last_build_date, :published_date, :ttl, :skip_days, :generator, :docs, :author, :image_url, :image_title, :image_width, :image_height, :image_link, :is_explicit, :categories

  index do
    id_column
    column :title
    actions
  end

end
