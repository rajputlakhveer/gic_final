class AvailableDate < ApplicationRecord
  belongs_to :upcoming_trip

  def self.ransackable_associations(auth_object = nil)
    ["upcoming_trip"]
  end
end