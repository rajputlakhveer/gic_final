class Itinerary < ApplicationRecord
  belongs_to :upcoming_trip

  validates_presence_of :title, :day, :description
end
