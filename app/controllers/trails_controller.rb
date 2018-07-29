class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.trips
    @total_trips = @trail.total_trips
  end
end
