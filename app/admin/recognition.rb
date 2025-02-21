ActiveAdmin.register Recognition do
  permit_params :title, :logo

  actions :all, except: [:destroy]

  member_action :delete_recognition, method: :get do
    recognition = Recognition.find(params[:id])
    recognition.destroy
    redirect_to admin_recognitions_path, notice: "Recognition deleted successfully."
  end

  remove_filter :logo_attachment, :logo_blob

  show do
    attributes_table do
      row :title
      row :logo do |trip|
        image_tag url_for(trip.logo), style: "max-width: 150px; margin-right: 10px;" if trip.logo.attached?
      end
      div do 
        link_to "Delete Recognition", delete_recognition_admin_recognition_path(recognition), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :logo, as: :file
    end

    f.actions
  end

end
