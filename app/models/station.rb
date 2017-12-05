class Station < ActiveRecord::Base
  has_many :start_trip, class_name: "Trip", foreign_key: :start_station_id
  has_many :end_trip, class_name: "Trip", foreign_key: :end_station_id
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :latitude,
                        :longitude

  scope :view_order, -> {order(:city, :name)}
  scope :city_groups, -> {group(:city)}
  scope :average_dock_count, -> {average(:dock_count).to_f.round(2)}
  scope :maximum_dock_count, -> {maximum(:dock_count)}
  scope :mininum_dock_count, -> {minimum(:dock_count)}
  scope :max_dock_count_station, -> {order(:dock_count).last}
  scope :min_dock_count_station, -> {order(:dock_count).first}
  scope :newest_station, -> {order(:installation_date).first}
  scope :oldest_station, -> {order(:installation_date).last}

  def rides_started
    start_trip.count
  end

  def rides_ended
    end_trip.count
  end

  def most_popular_end_station
    Station.first.start_trip.select("trips.*, count(trips.id) AS trip_count").group(:start_station_id, :id).order('trip_count DESC').first.end_station
  end

  def most_popular_start_station
    Station.first.end_trip.select("trips.*, count(trips.id) AS trip_count").group(:end_station_id, :id).order('trip_count DESC').first.start_station
  end

  def date_most_rides_started
    start_trip.group(:start_date).order('count(*) DESC').count.first.first
  end

  def most_common_zipcode
    start_trip.group(:zipcode).order('count(*) DESC').count.first.first
  end

  def bike_most_commonly_started_on
    start_trip.group(:bike_id).order('count(*) DESC').count.first.first
  end

  def self.max_occurance(column)
    group(column).order('count(*) DESC').count.first.first
  end
end
