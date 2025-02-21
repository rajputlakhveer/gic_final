class UpcomingTrip < ApplicationRecord
  has_one_attached :poster
  has_many_attached :gallery
  has_one_attached :itinerary_pdf

  has_many :itineraries, dependent: :destroy
  has_many :available_dates, dependent: :destroy
  accepts_nested_attributes_for :itineraries, allow_destroy: true

  enum :status, { active: 0, inactive: 1 }

  before_save :generate_itineraries

  def self.ransackable_associations(auth_object = nil)
    ["gallery_attachments", "gallery_blobs", "itineraries", "available_dates", "poster_attachment", "poster_blob", "itinerary_pdf_blob", "itinerary_pdf_attachment"]
  end

  private

  def generate_itineraries
    return unless start_date && number_of_days

    itineraries.clear
    (0...number_of_days).each do |day_index|
      itineraries.build(
        title: "Day #{day_index + 1} Itinerary",
        date: start_date + day_index.days,
        day: day_index + 1,
        description: "Description for day #{day_index + 1}"
      )
    end
  end
end