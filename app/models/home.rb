class Home < ApplicationRecord

	acts_as_list

	enum :slide_category, {
    upcoming_trip: 0,
    upcoming_festival_trip: 1,
    trip_frames: 2,
    gic_passport: 3,
    why_gic: 4,
    about_us: 5,
    testimonials: 6,
    chat_with_us: 7,
    recognition: 8
  }

  validates :slide_category, presence: true
end
