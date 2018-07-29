class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def sum_trail_length
    trails.sum(:length)
  end

  def avg_trails_length
    trails.average(:length)
  end

  def longest_trail
    trails.order('length desc').first
  end

  def shortest_trail
    trails.order(:length).first
  end
end
