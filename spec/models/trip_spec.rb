require 'rails_helper'

describe Trip do
  describe 'instance methods' do
    it 'can determine total length of all trails in trip' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_1.length + trail_2.length

      expect(trip.total_length).to eq expected
    end
    it 'can determine average length of all trails in trip' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = (trail_1.length + trail_2.length) / 2

      expect(trip.average_length).to eq expected
    end
    it 'can determine longest length of all trails in trip' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_2.length

      expect(trip.longest_length).to eq expected
    end
    it 'can determine Shortest length of all trails in trip' do
      trip = Trip.create(name:'first', start_date:'8/1/2010', end_date:'8/1/2010')
      trail_1 = Trail.create!(name: 'atrail', length: 8, address:'haha')
      trail_2 = Trail.create!(name: 'anothertrail', length: 9, address:'hehe')
      trip_trail_1 = trip.trip_trails.create!(trail:trail_1)
      trip_trail_2 = trip.trip_trails.create!(trail:trail_2)
      expected = trail_1.length

      expect(trip.shortest_length).to eq expected
    end
  end
end
