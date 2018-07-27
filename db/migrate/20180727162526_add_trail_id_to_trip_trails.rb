class AddTrailIdToTripTrails < ActiveRecord::Migration[5.1]
  def change
    add_reference :trip_trails, :trail, index: true, foreign_key: true
  end
end
