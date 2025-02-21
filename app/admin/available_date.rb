ActiveAdmin.register AvailableDate do
  permit_params :start_date, :end_date, :availability, :upcoming_trip_id

  actions :all, except: [:destroy]

  member_action :delete_available_date, method: :get do
    available_date = AvailableDate.find(params[:id])
    available_date.destroy
    redirect_to admin_available_dates_path, notice: "Available Date deleted successfully."
  end

  remove_filter :poster_attachment, :poster_blob

  show do
    attributes_table do
      row :start_date
      row :end_date
      row :upcoming_trip
      row :availability
      div do 
        link_to "Delete Available Date", delete_available_date_admin_available_date_path(available_date), method: :get
      end
    end
  end


  form do |f|
    f.inputs do
      f.input :start_date
      f.input :end_date
      f.input :upcoming_trip_id, as: :select, collection: UpcomingTrip.all.map { |trip| [trip.title, trip.id] }, include_blank: "Select a Trip"
      f.input :availability
    end
    f.actions
  end

end
