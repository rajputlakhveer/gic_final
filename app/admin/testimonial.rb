ActiveAdmin.register Testimonial do
  permit_params :name, :location, :story, :image

  actions :all, except: [:destroy]

  member_action :delete_testimonial, method: :get do
    testimonial = Testimonial.find(params[:id])
    testimonial.destroy
    redirect_to admin_testimonials_path, notice: "Testimonial deleted successfully."
  end

  remove_filter :image_attachment, :image_blob

  show do
    attributes_table do
      row :name
      row :location
      row :story
      row :image do |trip|
        image_tag url_for(trip.image), style: "max-width: 150px; margin-right: 10px;" if trip.image.attached?
      end
      div do 
        link_to "Delete Testimonial", delete_testimonial_admin_testimonial_path(testimonial), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :location
      f.input :story
      f.input :image,  as: :file
    end
    
    f.actions
  end

end
