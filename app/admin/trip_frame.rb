ActiveAdmin.register TripFrame do
  permit_params :location, :poster

  actions :all, except: [:destroy]

  member_action :delete_trip, method: :get do
    trip_frame = TripFrame.find(params[:id])
    trip_frame.destroy
    redirect_to admin_trip_frames_path, notice: "Trip Frame deleted successfully."
  end

  show do
    attributes_table do
      row :location
      row :poster do |trip|
        image_tag url_for(trip.poster), style: "max-width: 150px; margin-right: 10px;" if trip.poster.attached?
      end
      div do 
        link_to "Delete Frame", delete_trip_admin_trip_frame_path(trip_frame), method: :get
      end
    end
  end

  remove_filter :poster_attachment, :poster_blob

  form do |f|
    f.inputs do
      f.input :location
      f.input :poster,  as: :file
    end
    
    f.actions
  end

end
