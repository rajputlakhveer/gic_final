class TripItem < ApplicationRecord
  belongs_to :upcoming_trip

  enum :category, { inclusion: 0, exclusion: 1, things_to_carry: 2 }

  has_one_attached :icon
  validates_presence_of :title, :description, :category

  def self.ransackable_associations(auth_object = nil)
    ["upcoming_trip", "icon_blob", "icon_attachment"]
  end
end