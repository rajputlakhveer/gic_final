ActiveAdmin.register TripItem do
  permit_params :title, :description, :category, :upcoming_trip_id, :icon

  remove_filter :icon_attachment, :icon_blob

  form do |f|
    f.inputs "Trip Item Details" do
      f.input :upcoming_trip
      f.input :category
      f.input :title
      f.input :icon, as: :file
      f.input :description
    end
    f.actions
  end
end
