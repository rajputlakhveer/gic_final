ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  actions :all, except: [:destroy]

  member_action :delete_admin_user, method: :get do
    admin_user = AdminUser.find(params[:id])
    admin_user.destroy
    redirect_to admin_admin_users_path, notice: "admin user deleted successfully."
  end

  remove_filter :poster_attachment, :poster_blob

  show do
    attributes_table do
      row :email
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
      div do 
        link_to "Delete admin user", delete_admin_user_admin_admin_user_path(admin_user), method: :get
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
