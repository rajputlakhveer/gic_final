class UpcomingTrip < ApplicationRecord
  has_one_attached :poster
  has_one_attached :banner
  has_many_attached :gallery
  has_one_attached :itinerary_pdf
  has_one_attached :trip_table

  has_many :itineraries, dependent: :destroy
  has_many :available_dates, dependent: :destroy
  accepts_nested_attributes_for :itineraries, allow_destroy: true

  enum :status, { active: 0, inactive: 1 }
  enum :customise_trip_type, {
    himachal: 0,
    uttarakhand: 1,
    kashmir: 2,
    kerala: 3,
    rajasthan: 4,
    sikkim: 5,
    tamil_nadu: 6,
    karnataka: 7,
    goa: 8,
    meghalaya: 9,
    andaman: 10,
    honeymoon_packages: 11,
    family_trip_packages: 12,
    school_and_college_trips: 13
  }

  enum :group_trip_type, {
    backpacking_trips: 0,
    weekend_trips: 1,
    treks: 2
  }

  before_create :generate_itineraries

  def self.ransackable_associations(auth_object = nil)
    ["gallery_attachments", "gallery_blobs", "trip_table_attachments", "trip_table_blobs", "itineraries", "available_dates", "poster_attachment", "poster_blob", "itinerary_pdf_blob", "itinerary_pdf_attachment", "banner_attachment", "banner_blob"]
  end

  private

  def generate_itineraries
    return unless number_of_days

    itineraries.clear
    (0...number_of_days).each do |day_index|
      itineraries.build(
        title: "Day #{day_index + 1} Itinerary",
        day: day_index + 1,
        description: "Description for day #{day_index + 1}"
      )
    end
  end
end