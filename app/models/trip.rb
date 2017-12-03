class Trip <ActiveRecord::Base
  belongs_to :station

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
  scope :station_most_start_rides, -> {maximum(:start_station)}
  scope :station_most_end_rides, -> {maximum(:end_station)}
  scope :date_with_most_rides, -> {maximum(:start_date)}
  scope :date_with_most_rides_trip_count, -> {group(:start_date).count.values.max}
  scope :date_with_least_rides, -> {minimum(:start_date)}
  scope :date_with_least_rides_trip_count, -> {group(:start_date).count.values.min}


end
