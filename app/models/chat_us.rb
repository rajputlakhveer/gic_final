class ChatUs < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :phone_number, :comment
end