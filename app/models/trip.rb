class Trip < ApplicationRecord

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_length
    trails.pluck(:length).sum
  end

  def average_length
    unless trails.count == 0
      total_length / trails.count
    else
      0
    end
  end

  def longest_length
    trails.pluck(:length).max
  end

  def shortest_length
    trails.pluck(:length).min
  end
end
