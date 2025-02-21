ActiveAdmin.register Blog do
  permit_params :title, :description, :poster

  actions :all, except: [:destroy]

  member_action :delete_blog, method: :get do
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to admin_blogs_path, notice: "Blog deleted successfully."
  end

  remove_filter :poster_attachment, :poster_blob

  show do
    attributes_table do
      row :title
      row :description
      row :poster do |trip|
        image_tag url_for(trip.poster), style: "max-width: 150px; margin-right: 10px;" if trip.poster.attached?
      end
      div do 
        link_to "Delete Blog", delete_blog_admin_blog_path(blog), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :poster,  as: :file
    end
    
    f.actions
  end

end
