require 'rails_helper'

describe 'a user visits the trips index page' do
  it 'sees all the trips' do
    trip_one = Trip.create(name: 'Blog')
    trip_two = Trip.create(name: 'Furt')
    trip_you = Trip.create(name: 'Konq')

    visit trips_path

    expect(page).to have_content(trip_one.name)
    expect(page).to have_content(trip_two.name)
    expect(page).to have_content(trip_you.name)
  end
  it 'clicks name of trip to see trip show page' do
    trip_one = Trip.create(name: 'Blog')
    trip_two = Trip.create(name: 'Furt')
    trip_you = Trip.create(name: 'Konq')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    visit trips_path

    click_on trip_one.name

    expect(current_path).to eq(trip_path(trip_one))
    expect(page).to have_content(trip_one.name)
  end
  it 'can see all trails for a trip on trip show page' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    visit trip_path(trip_one)

    expect(page).to have_content(trip_one.name)
    expect(page).to have_content(trail_one.name)
    expect(page).to have_content(trail_one.length)
    expect(page).to have_content(trail_one.address)
    expect(page).to have_content(trail_two.name)
    expect(page).to have_content(trail_two.length)
    expect(page).to have_content(trail_two.address)
  end
  it 'can see a sum of trail lengths on trips show' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    total_miles = trail_one.length + trail_two.length

    visit trip_path(trip_one)

    expect(page).to have_content("Total miles of trail: #{total_miles}")
  end
  it 'can see an average of trail lengths on trips show' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    avg_miles = (trail_one.length + trail_two.length) / 2.0

    visit trip_path(trip_one)

    expect(page).to have_content("Average miles of trail: #{avg_miles}")
  end
  it 'can see the trail with the longest length on trips show' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    visit trip_path(trip_one)

    expect(page).to have_content("Trail with most miles: #{trail_two.name}")
  end
  it 'can see the trail with the shortest length on trips show' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    visit trip_path(trip_one)

    expect(page).to have_content("Trail with least miles: #{trail_one.name}")
  end
  it 'can go to a specific trail show page' do
    trip_one = Trip.create(name: 'Blog')
    trail_one = trip_one.trails.create(length: 5, name: 'Truy', address: '15632gut')
    trail_two = trip_one.trails.create(length: 8, name: 'Tucks', address: '756Hump')

    visit trip_path(trip_one)

    click_on trail_one.name

    expect(current_path).to eq(trail_path(trail_one))
    expect(page).to have_content(trail_one.name)
    expect(page).to have_content(trail_one.length)
    expect(page).to have_content(trail_one.address)
  end
end
