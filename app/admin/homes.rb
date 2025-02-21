ActiveAdmin.register Home do
  permit_params :title, :subtitle, :slide_category, :position

  actions :all, except: [:destroy]

  member_action :delete_home, method: :get do
    home = Home.find(params[:id])
    home.destroy
    redirect_to admin_homes_path, notice: "Home deleted successfully."
  end

  show do
    attributes_table do
      row :title
      row :subtitle
      row :slide_category
      row :position
      div do 
        link_to "Delete Home", delete_home_admin_home_path(home), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :slide_category
      f.input :position
    end
    f.actions
  end

end
