require 'rails_helper'

describe 'user visits a trail page' do
  it 'sees the name address and total length of every hiking trip that includes the trail' do
    trip_one = Trip.create(name: 'fla', address: '6756')
    trip_two = Trip.create(name: 'fla', address: '6756')

    trail_one = Trail.create(name: 'borg', length: 50, address: '808')
    trail_two = Trail.create(name: 'fibr', length: 5, address: '303')
    trail_you = Trail.create(name: 'fojk', length: 10, address: '606')
    trail_mee = Trail.create(name: 'foklp', length: 20, address: '909')

    trip_one_trail_one = TripTrail.create(trip_id: trip_one.id, trail_id: trail_one.id)
    trip_one_trail_two = TripTrail.create(trip_id: trip_one.id, trail_id: trail_you.id)
    trip_one_trail_tre = TripTrail.create(trip_id: trip_one.id, trail_id: trail_mee.id)

    trip_two_trail_one = TripTrail.create(trip_id: trip_two.id, trail_id: trail_one.id)
    trip_two_trail_two = TripTrail.create(trip_id: trip_two.id, trail_id: trail_two.id)

    visit trail_path(trail_one)

    expect(page).to have_content(trip_one.name)
    expect(page).to have_content(trip_one.address)
    expect(page).to have_content("Total length of trails for this trip: 80")
    expect(page).to have_content(trip_two.name)
    expect(page).to have_content(trip_two.address)
    expect(page).to have_content("Total length of trails for this trip: 55")
  end
  it 'sees the name address and total length of every hiking trip that includes the trail' do
    trip_one = Trip.create(name: 'fla', address: '6756')
    trip_two = Trip.create(name: 'fla', address: '6756')

    trail_one = Trail.create(name: 'borg', length: 50, address: '808')
    trail_two = Trail.create(name: 'fibr', length: 5, address: '303')
    trail_you = Trail.create(name: 'fojk', length: 10, address: '606')
    trail_mee = Trail.create(name: 'foklp', length: 20, address: '909')

    trip_one_trail_one = TripTrail.create(trip_id: trip_one.id, trail_id: trail_one.id)
    trip_one_trail_two = TripTrail.create(trip_id: trip_one.id, trail_id: trail_you.id)
    trip_one_trail_tre = TripTrail.create(trip_id: trip_one.id, trail_id: trail_mee.id)

    trip_two_trail_one = TripTrail.create(trip_id: trip_two.id, trail_id: trail_one.id)
    trip_two_trail_two = TripTrail.create(trip_id: trip_two.id, trail_id: trail_two.id)

    visit trail_path(trail_one)

    expect(page).to have_content("Total number of trips that include this trail: 2")
  end
end
