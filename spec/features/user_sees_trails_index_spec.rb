require 'rails_helper'

describe 'User visits trails index' do
  it 'sees all trails' do
    trip_one = Trip.create(name: 'GOGOT')
    trip_two = Trip.create(name: 'HUIUH')

    visit trips_path

    expect(page).to have_content(trip_one.name)
    expect(page).to have_content(trip_two.name)
  end
end
