ActiveAdmin.register Career do
  permit_params :role, :description, :job_type

  actions :all, except: [:destroy]

  member_action :delete_career, method: :get do
    career = Career.find(params[:id])
    career.destroy
    redirect_to admin_careers_path, notice: "Career deleted successfully."
  end

  show do
    attributes_table do
      row :role
      row :description
      row :job_type
      div do 
        link_to "Delete Career", delete_career_admin_career_path(career), method: :get
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :role
      f.input :description
      f.input :job_type
    end
    
    f.actions
  end

end
