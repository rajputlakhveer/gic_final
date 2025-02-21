class UpcomingTripsController < ApplicationController
  def index
    @upcoming_trips = UpcomingTrip.all
  end

  def offbeat_trips
    @upcoming_trips = UpcomingTrip.where(offbeat_trip: true)
  end

  def festival_trips
    @upcoming_trips = UpcomingTrip.where(festival_trip: true)
  end

  def corporate_trips
    @upcoming_trips = UpcomingTrip.where(corporate_trip: true)
  end

  def group_trips
    @upcoming_trips = UpcomingTrip.where(group_trip: true)
  end
end
