require 'rails_helper'

describe 'User visits trails index' do
  it 'sees all trails' do
    trip_one = Trip.create(name: 'GOGOT')
    trip_two = Trip.create(name: 'HUIUH')

    visit trips_path

    expect(page).to have_content(trip_one.name)
    expect(page).to have_content(trip_two.name)
  end
  it 'can view an individual trip' do
    trip_one = Trip.create(name: 'GOGOT')

    visit trips_path

    click_link "#{trip_one.name}"

    expect(current_path).to eq(trip_path(trip_one))
    expect(page).to have_content(trip_one.name)
  end
  it 'can see a trips trails' do
    trip_one = Trip.create(name: 'GOGOT')
    trail_one = trip_one.trails.create(length: 4, name: 'hell yes', address: '111')
    binding.pry
    visit trips_path

    click_link "#{trip_one.name}"
  end
end
