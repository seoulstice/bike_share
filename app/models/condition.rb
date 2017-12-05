class Condition < ActiveRecord::Base
  has_many :trips

  def self.temperature_ranges
    max = Condition.maximum(:max_temperature_f)
    min = Condition.minimum(:max_temperature_f)
    number_of_groups = ((max-min) / 10).ceil
    (1..number_of_groups).map do |number|
      [(min + (number-1)*10), (min + number * 10)]
    end
  end

  def self.rides_on_days_in_temp_range(lower, upper)
    days_in_range = Condition.where("conditions.max_temperature_f >= #{lower} AND conditions.max_temperature_f <= #{upper}").select("conditions.*, avg(date) AS avg_rides")



    # count_trips_in_range = days_in_range.map do |day|
    #   day.trips.count
    # end
    # count_trips_in_range.sum / count_trips_in_range.count
  end

  def self.trip

  end
end
