class Trip <ActiveRecord::Base
  belongs_to :station
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

  scope :longest_ride, -> {maximum(:duration)}
  scope :shortest_ride, -> {minimum(:duration)}
  scope :average_duration, -> {average(:duration).to_f.round(2)}
  scope :station_most_start_rides, -> {max_occurrence(:start_station)}
  scope :station_most_end_rides, -> {max_occurrence(:end_station)}
  scope :date_with_most_rides, -> {max_occurrence(:start_date)}
  scope :date_with_most_rides_trip_count, -> {group(:start_date).count.values.max}
  scope :date_with_least_rides, -> {min_occurrence(:start_date)}
  scope :date_with_least_rides_trip_count, -> {group(:start_date).count.values.min}
  scope :most_ridden_bike, -> {max_occurrence(:bike_id)}
  scope :most_ridden_bike_ride_count, -> {group(:bike_id).count.values.max}
  scope :least_ridden_bike, -> {min_occurrence(:bike_id)}
  scope :least_ridden_bike_ride_count, -> {group(:bike_id).count.values.min}
  scope :rides_by_year, -> {group("DATE_TRUNC('year', start_date)").count}
  scope :rides_by_month, -> {group("DATE_TRUNC('month', start_date)").count}
  scope :subscription_groups, -> {group(:subscription_type)}

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
    Condition.find_by(date: Trip.ddate_with_least_rides)
  end
end
