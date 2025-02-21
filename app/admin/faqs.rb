ActiveAdmin.register Faq do
  permit_params :question, :answer

  actions :all, except: [:destroy]

  member_action :delete_faq, method: :get do
    faq = Faq.find(params[:id])
    faq.destroy
    redirect_to admin_faqs_path, notice: "Faq deleted successfully."
  end

  show do
    attributes_table do
      row :question
      row :answer
      div do 
        link_to "Delete Faq", delete_faq_admin_faq_path(faq), method: :get
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :question
      f.input :answer
    end
    f.actions
  end

end
