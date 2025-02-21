class Itinerary < ApplicationRecord
  belongs_to :upcoming_trip

  validates_presence_of :title, :date, :day, :description
end
