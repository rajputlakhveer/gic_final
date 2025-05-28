ActiveAdmin.register UpcomingTrip do
  permit_params :title, :description, :inclusion, :trip_table, :exclusion, :customise_trip_type, :group_trip_type, :things_to_carry, :upcoming_trip, :offbeat_trip, :festival_trip, :group_trip, :customise_trip, :book_now_url, :corporate_trip, :status, :number_of_days, :poster, :start_location, :end_location, :price, :itinerary_pdf, :banner, gallery: [], itineraries_attributes: [:id, :title, :date, :day, :description, :_destroy]

  actions :all, except: [:destroy]

  member_action :delete_trip, method: :get do
    upcoming_trip = UpcomingTrip.find(params[:id])
    upcoming_trip.destroy
    redirect_to admin_upcoming_trips_path, notice: "Upcoming Trip deleted successfully."
  end

  remove_filter :itinerary_pdf_attachment, :itinerary_pdf_blob
  remove_filter :gallery_attachments, :gallery_blobs
  remove_filter :poster_attachment, :poster_blob
  remove_filter :banner_attachment, :banner_blob
  remove_filter :trip_table_attachment, :trip_table_blob

  show do
    attributes_table do
      row :title
      row :description
      row :upcoming_trip
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
      row :group_trip_type
      row :customise_trip_type
      row :inclusion
      row :exclusion
      row :things_to_carry
      row :book_now_url
      row :trip_table do |trip|
        image_tag url_for(trip.trip_table), style: "max-width: 150px; margin-right: 10px;" if trip.trip_table.attached?
      end
      row :poster do |trip|
        image_tag url_for(trip.poster), style: "max-width: 150px; margin-right: 10px;" if trip.poster.attached?
      end
      row :banner do |trip|
        image_tag url_for(trip.banner), style: "max-width: 150px; margin-right: 10px;" if trip.banner.attached?
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
      f.input :upcoming_trip
      f.input :status
      f.input :number_of_days
      f.input :poster, as: :file
      f.input :banner, as: :file
      f.input :gallery, as: :file, input_html: { multiple: true }
      f.input :itinerary_pdf, as: :file
      f.input :trip_table, as: :file
      f.input :book_now_url
      f.input :start_location
      f.input :end_location
      f.input :price
      f.input :group_trip_type
      f.input :customise_trip_type
      f.input :inclusion
      f.input :exclusion
      f.input :things_to_carry
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
