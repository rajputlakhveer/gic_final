ActiveAdmin.register TravellerStory do
  permit_params :title, :story, :poster

  actions :all, except: [:destroy]

  member_action :delete_story, method: :get do
    traveller_story = TravellerStory.find(params[:id])
    traveller_story.destroy
    redirect_to admin_traveller_stories_path, notice: "Traveller Story deleted successfully."
  end

  remove_filter :poster_attachment, :poster_blob

  show do
    attributes_table do
      row :title
      row :story
      row :poster do |trip|
        image_tag url_for(trip.poster), style: "max-width: 150px; margin-right: 10px;" if trip.poster.attached?
      end
      div do 
        link_to "Delete Story", delete_story_admin_traveller_story_path(traveller_story), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :story
      f.input :poster,  as: :file
    end
    
    f.actions
  end

end
