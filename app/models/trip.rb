class Trip <ActiveRecord::Base
  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"
  belongs_to :condition

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id,
                        :subscription_type

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
    group(:start_station).order('count(*) DESC').count.first.first
  end

  def self.top_five_stations
    group(:start_station).order('count(*) DESC').limit(5).count
  end

  def self.station_most_end_rides
    group(:end_station).order('count(*) DESC').count.first.first

  end

  def self.date_with_most_rides
    group(:start_date).order('count(*) DESC').count.first.first
  end

  def self.date_with_least_rides
    group(:start_date).order('count(*)').count.first.first
  end

  def self.date_with_most_rides_trip_count
    group(:start_date).count.values.max
  end

  def self.date_with_least_rides_trip_count
    group(:start_date).count.values.min
  end

  def self.most_ridden_bike
    group(:bike_id).order('count(*) DESC').count.first.first
  end

  def self.most_ridden_bike_ride_count
    group(:bike_id).count.values.max
  end

  def self.least_ridden_bike
    group(:bike_id).order('count(*)').count.first.first
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

  def self.count_by_subscription_type
    group(:subscription_type).order('count(*)').count
  end
end
