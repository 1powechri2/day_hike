require 'rails_helper'

describe Trip do
  describe 'instance methods' do
    it 'can find the sum of the length of the trails' do
      trip_one = Trip.create(name: 'Blog')
      trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
      trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

      expect(trip_one.sum_trail_length).to eq(trail_one.length + trail_two.length)
    end
    it 'can find the average of the length of the trails' do
      trip_one = Trip.create(name: 'Blog')
      trail_one = trip_one.trails.create(length: 7, name: 'Truy', address: '15632gut')
      trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

      expect(trip_one.avg_trails_length).to eq((trail_one.length + trail_two.length)/2.0)
    end
    it 'can find the trail with the longest length' do
      trip_one = Trip.create(name: 'Blog')
      trail_one = trip_one.trails.create(length: 7, name: 'Truy', address: '15632gut')
      trail_two = trip_one.trails.create(length:20, name: 'Tucks', address: '756Hump')

      expect(trip_one.longest_trail).to eq(trail_two)
    end
    it 'can find the trail with the shortest length' do
      trip_one = Trip.create(name: 'Blog')
      trail_one = trip_one.trails.create(length: 7, name: 'Truy', address: '15632gut')
      trail_two = trip_one.trails.create(length:20, name: 'Tucks', address: '756Hump')

      expect(trip_one.shortest_trail).to eq(trail_one)
    end
  end
end
