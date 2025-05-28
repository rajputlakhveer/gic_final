class UpcomingTripsController < ApplicationController
  def index
    @upcoming_trips = UpcomingTrip.where(upcoming_trip: true)
  end

  def offbeat_trips
    @upcoming_trips = UpcomingTrip.where(offbeat_trip: true)
  end

  def festival_trips
    @upcoming_trips = UpcomingTrip.where(festival_trip: true)
  end

  def corporate_trips
    @upcoming_trips = UpcomingTrip.where(corporate_trip: true, )
  end

  def group_trips
     if params[:type].present?
      @upcoming_trips = UpcomingTrip.where(group_trip: true, group_trip_type: params[:type])
    else
      @upcoming_trips = UpcomingTrip.where(group_trip: true)
    end
  end

  def customise_trips
    if params[:type].present?
      @upcoming_trips = UpcomingTrip.where(customise_trip: true, customise_trip_type: params[:type])
    else
      @upcoming_trips = UpcomingTrip.where(customise_trip: true)
    end
  end
end
