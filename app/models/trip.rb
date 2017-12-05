class Trip <ActiveRecord::Base
  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"
  belongs_to :condition

  validates_presence_of :duration,
                        :start_date,
                        :start_station,
                        :end_date,
                        :end_station,
                        :bike_id,
                        :subscription_type

  def start_station_latitude
    Station.find(start_station_id).latitude
  end

  def start_station_longitude
    Station.find(start_station_id).longitude
  end

  def end_station_latitude
    Station.find(end_station_id).latitude
  end

  def end_station_longitude
    Station.find(end_station_id).longitude
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.average_duration
    average(:duration).to_f.round(2)
  end

  def self.avergage_duration
    average(:duration).to_f.round(2)
  end

  def self.station_most_start_rides
    max_occurrence(:start_station)
  end

  def self.station_most_end_rides
    max_occurrence(:end_station)
  end

  def self.date_with_most_rides
    max_occurrence(:start_date)
  end

  def self.date_with_most_rides_trip_count
    group(:start_date).count.values.max
  end

  def self.date_with_least_rides
    min_occurrence(:start_date)
  end

  def self.date_with_least_rides_trip_count
    group(:start_date).count.values.min
  end

  def self.most_ridden_bike
    max_occurrence(:bike_id)
  end

  def self.most_ridden_bike_ride_count
    group(:bike_id).count.values.max
  end

  def self.least_ridden_bike
    min_occurrence(:bike_id)
  end

  def self.least_ridden_bike_ride_count
    group(:bike_id).count.values.min
  end

  def self.rides_by_year
    group("DATE_TRUNC('year', start_date)").count
  end

  def self.rides_by_month
    group("DATE_TRUNC('month', start_date)").count
  end

  def self.subscription_groups
    group(:subscription_type)
  end

  def self.max_occurrence(column)
    group(column).order('count(*) DESC').count.first.first
  end

  def self.min_occurrence(column)
    group(column).order('count(*)').count.first.first
  end

  def self.count_by_subscription_type
    group(:subscription_type).order('count(*)').count
  end

  def self.weather_on_date_most_rides
    Condition.find_by(date: Trip.date_with_most_rides)
  end

  def self.weather_on_date_least_rides
    Condition.find_by(date: Trip.date_with_least_rides)
  end
end
