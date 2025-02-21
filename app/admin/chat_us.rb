ActiveAdmin.register ChatUs do
  actions :index, :show

  member_action :delete_chat, method: :get do
    chat = ChatUs.find(params[:id])
    chat.destroy
    redirect_to admin_chat_us_path, notice: "Chat deleted successfully."
  end

  show do
    attributes_table do
      row :name do |chat|
        "#{chat.first_name} #{chat.last_name}"
      end
      row :email
      row :phone_number
      row :comment
      div do 
        link_to "Delete Chat", delete_chat_admin_chat_u_path(chat_us), method: :get
      end
    end
  end 
end
