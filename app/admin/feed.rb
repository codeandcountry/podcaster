ActiveAdmin.register Feed do

  permit_params :title, :description, :slug, :atom_link, :link, :subtitle, :summary, :language, :copyright, :owner_name, :owner_email, :last_build_date, :published_date, :ttl, :skip_days, :generator, :docs, :author, :image_url, :image_title, :image_width, :image_height, :image_link, :is_explicit, :categories, :uses_podtrac, :ftp_folder_path, :ftp_folder_url, :managing_editor, :web_master

  index do
    id_column
    column :title
    actions
  end

  form do |f|

    f.inputs "About" do
      f.input :title 
      f.input :description 
      f.input :subtitle 
      f.input :summary 
      
      f.input :slug 
      
      f.input :atom_link 
      f.input :link 
      
      f.input :last_build_date 
      f.input :published_date 

      f.input :author 
      f.input :categories, as: :select, :collection => ["Arts", "Business", "Comedy", "Education", "Games & Hobbies", "Government & Organizations", "Health", "Kids & Family", "Music", "News & Politics", "Religion & Spirituality", "Science & Medicine", "Society & Culture", "Sports & Recreation", "Technology", "TV & Film"]
      f.input :docs 
    end

    f.inputs "Feed/Default Image" do
      f.input :image_url 
      f.input :image_title 
      f.input :image_width 
      f.input :image_height 
      f.input :image_link 
    end

    f.inputs "Owner information" do
      f.input :managing_editor 
      f.input :web_master
      f.input :copyright 
      f.input :owner_name 
      f.input :owner_email 
    end

    f.inputs "Configuration" do
      f.input :uses_podtrac 
      f.input :ftp_folder_path 
      f.input :ftp_folder_url 
      f.input :skip_days
      f.input :ttl
      f.input :generator
      f.input :is_explicit
      f.input :language 
    end
  end


end
