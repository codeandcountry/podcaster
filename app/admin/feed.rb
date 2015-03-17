ActiveAdmin.register Feed do

  permit_params :title, :description, :slug, :atom_link, :link, :subtitle, :summary, :language, :copyright, :owner_name, :owner_email, :last_build_date, :published_date, :ttl, :skip_days, :generator, :docs, :author, :image_url, :image_title, :image_width, :image_height, :image_link, :is_explicit, :categories, :uses_podtrac, :ftp_folder_path, :ftp_folder_url, :managing_editor, :web_master

  index do
    id_column
    column :title
    actions
  end

end
