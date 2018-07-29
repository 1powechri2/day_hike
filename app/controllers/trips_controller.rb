class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trails = @trip.trails
    @length_sum = @trip.sum_trail_length
    @avg_miles  = @trip.avg_trails_length
    @longest = @trip.longest_trail
    @shortest = @trip.shortest_trail
  end
end
