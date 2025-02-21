# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Creating Home Page Slides
slides_data = [
  { slide_category: :upcoming_trip, title: "Upcoming Trip", subtitle: "Discover your next adventure", position: 1 },
  { slide_category: :upcoming_festival_trip, title: "Festival Trips", subtitle: "Celebrate with us", position: 2 },
  { slide_category: :trip_frames, title: "Trip Frames", subtitle: "Memories captured", position: 3 },
  { slide_category: :gic_passport, title: "GIC Passport", subtitle: "Easy travel solutions", position: 4 },
  { slide_category: :why_gic, title: "Why GIC?", subtitle: "Top reasons to choose us", position: 5 },
  { slide_category: :about_us, title: "About Us", subtitle: "Get to know us better", position: 6 },
  { slide_category: :testimonials, title: "Testimonials", subtitle: "Hear from our happy travelers", position: 7 },
  { slide_category: :chat_with_us, title: "Chat With Us", subtitle: "We're here to help", position: 8 },
  { slide_category: :recognition, title: "Recognition", subtitle: "Our achievements", position: 9 }
]

slides_data.each do |slide|

  Home.find_or_create_by(slide_category: Home.slide_categories[slide[:slide_category]]) do |s|
    s.title = slide[:title]
    s.subtitle = slide[:subtitle]
    s.position = slide[:position]
  end
end

puts "Seed completed: #{Home.count} slides in total."
AdminUser.first_or_create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')