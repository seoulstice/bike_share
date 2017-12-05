class Condition < ActiveRecord::Base
  has_many :trips

  def self.temperature_ranges
    max = Condition.maximum(:max_temperature_f)
    min = Condition.minimum(:max_temperature_f)
    number_of_groups = ((max-min) / 10).ceil
    (0..number_of_groups+1).map do |number|
      [(min + (number-1)*10), (min + number * 10)]
    end
  end

  def self.rides_on_days_in_temp_range_order_desc(lower, upper)
    Condition.where("conditions.max_temperature_f > #{lower} AND conditions.max_temperature_f <= #{upper}")
             .joins(:trips)
             .group(:date)
             .order("count_all DESC")
             .count
             .values
  end

  def self.average(trips_in_range)
    return 0 if trips_in_range.empty?
    trips_in_range.sum / trips_in_range.count
  end

  def self.max(trips_in_range)
    return 0 if trips_in_range.empty?
    trips_in_range.first
  end

  def self.min(trips_in_range)
    return 0 if trips_in_range.empty?
    trips_in_range.last
  end
end
