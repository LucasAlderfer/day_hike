require 'rails_helper'

describe 'visiting a trail show page' do
  context 'as a visitor' do
    it 'shows all trips including that trail' do
      trip_1 = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trip_2 = Trip.create(name:'second', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trip_trail_1 = trip_1.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip_2.trip_trails.create!(trail:trail_1)

      visit trail_path(trail_1)

      expect(page).to have_content trip_1.name
      expect(page).to have_content trip_1.start_date
      expect(page).to have_content trip_1.end_date
      expect(page).to have_content trip_2.name
      expect(page).to have_content trip_2.start_date
      expect(page).to have_content trip_2.end_date
    end
    it 'shows number of trips including that trail' do
      trip_1 = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trip_2 = Trip.create(name:'second', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trip_trail_1 = trip_1.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip_2.trip_trails.create!(trail:trail_1)
      expected = 2

      visit trail_path(trail_1)

      expect(page).to have_content "Trips with this trail: #{expected}"
    end
  end
end
