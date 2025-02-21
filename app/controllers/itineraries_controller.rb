class ItinerariesController < ApplicationController
  def index
    @upcoming_trip = UpcomingTrip.find(params[:upcoming_trip_id])
    @itineraries = @upcoming_trip.itineraries
    @faqs = Faq.all
  end
end
