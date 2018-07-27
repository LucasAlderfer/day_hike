require 'rails_helper'

describe 'visiting /trips' do
  context 'as a visitor' do
    it 'can see all trips' do
      trip_1 = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trip_2 = Trip.create(name:'second', start_date:'8/1/2010', end_date:'8/1/2010')

      visit trips_path

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_1.start_date)
      expect(page).to have_content(trip_1.end_date)
      expect(page).to have_content(trip_2.name)
      expect(page).to have_content(trip_2.start_date)
      expect(page).to have_content(trip_2.end_date)
    end
    it 'can click a trips name and go to that trips show page' do
      trip_1 = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')

      visit trips_path

      click_link trip_1.name

      expect(current_path).to eq trip_path(trip_1)
    end
  end
end
