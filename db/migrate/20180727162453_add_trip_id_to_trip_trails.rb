class AddTripIdToTripTrails < ActiveRecord::Migration[5.1]
  def change
    add_reference :trip_trails, :trip, index: true, foreign_key: true
  end
end
