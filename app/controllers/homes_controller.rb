class HomesController < ApplicationController

  def index
    @homes = Home.all
    @upcoming_trips = UpcomingTrip.order(created_at: :desc).limit(10)
    @recognitions = Recognition.all
    @testimonials = Testimonial.all
    @trip_frames = TripFrame.all
  end

  def about_us
  end

  def contact
  end

  def blog
  end

  def payment
  end

  def founders
  end

  def album
  end

  def privacy_policy
  end

  def terms_and_conditions
  end

  def disclaimer
  end

  def payment_policy
  end

  def cancellation_policy
  end

  def search
    @results = UpcomingTrip.where("title LIKE ?", "%#{params[:q]}%").limit(5)
    render json: @results
  end
end
