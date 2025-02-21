ActiveAdmin.register UpcomingTrip do
  permit_params :title, :description, :offbeat_trip, :festival_trip, :group_trip, :customise_trip, :corporate_trip, :status, :number_of_days, :poster, :start_date, :end_date, :start_location, :end_location, :price, :itinerary_pdf, gallery: [], itineraries_attributes: [:id, :title, :date, :day, :description, :_destroy]

  actions :all, except: [:destroy]

  member_action :delete_trip, method: :get do
    upcoming_trip = UpcomingTrip.find(params[:id])
    upcoming_trip.destroy
    redirect_to admin_upcoming_trips_path, notice: "Upcoming Trip deleted successfully."
  end

  remove_filter :itinerary_pdf_attachment, :itinerary_pdf_blob
  remove_filter :gallery_attachments, :gallery_blobs
  remove_filter :poster_attachment, :poster_blob

  show do
    attributes_table do
      row :title
      row :description
      row :offbeat_trip
      row :festival_trip
      row :group_trip
      row :customise_trip
      row :corporate_trip
      row :status
      row :number_of_days
      row :start_location
      row :end_location
      row :price
      row :poster do |trip|
        image_tag url_for(trip.poster), style: "max-width: 150px; margin-right: 10px;" if trip.poster.attached?
      end
      row :gallery do |trip|
        trip.gallery.each do |photo|
          div do
            image_tag url_for(photo), style: "max-width: 150px; margin-right: 10px;"
          end
        end
      end
      row :itinerary_pdf do |trip|
        if trip.itinerary_pdf.attached?
          link_to "Download Itinerary PDF", rails_blob_path(trip.itinerary_pdf, disposition: "attachment")
        end
      end
      div do 
        link_to "Delete Trip", delete_trip_admin_upcoming_trip_path(upcoming_trip), method: :get
      end
    end
  end 


  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :offbeat_trip
      f.input :festival_trip
      f.input :group_trip
      f.input :customise_trip
      f.input :corporate_trip 
      f.input :status
      f.input :number_of_days
      f.input :poster, as: :file
      f.input :gallery, as: :file, input_html: { multiple: true }
      f.input :itinerary_pdf, as: :file
      f.input :start_date
      f.input :end_date
      f.input :start_location
      f.input :end_location
      f.input :price
      f.has_many :itineraries do |itinerary|
        itinerary.inputs "Itinerary Per Day" do
          itinerary.input :title
          itinerary.input :date
          itinerary.input :day
          itinerary.input :description
        end
      end
    end
    f.actions
  end
end
