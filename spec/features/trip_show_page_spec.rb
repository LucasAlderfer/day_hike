require 'rails_helper'

describe 'visiting a trip show page' do
  context 'as a visitor' do
    it 'shows all trails on that trip and all the trails information' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)

      visit trip_path(trip)

      expect(page).to have_content trail_1.name
      expect(page).to have_content trail_1.length
      expect(page).to have_content trail_1.address
      expect(page).to have_content trail_2.name
      expect(page).to have_content trail_2.length
      expect(page).to have_content trail_2.address
    end
    it 'shows the total hiking distance of the trip' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_1.length + trail_2.length

      visit trip_path(trip)

      expect(page).to have_content "Total Length: #{expected}"
    end
    it 'shows the average hiking distance of the trails' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = (trail_1.length + trail_2.length) / 2

      visit trip_path(trip)

      expect(page).to have_content "Average Length: #{expected}"
    end
    it 'shows the longest hiking distance of the trails' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_2.length

      visit trip_path(trip)

      expect(page).to have_content "Longest Length: #{expected}"
    end
    it 'shows the shortest hiking distance of the trails' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_1.length

      visit trip_path(trip)

      expect(page).to have_content "Shortest Length: #{expected}"
    end
    it 'can click the names of the trails to go to their show pages' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)

      visit trip_path(trip)

      click_link trail_1.name

      expect(current_path).to eq trail_path(trail_1)
    end
  end
end
