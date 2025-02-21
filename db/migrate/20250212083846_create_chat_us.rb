class CreateChatUs < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_us do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :comment

      t.timestamps
    end
  end
end
