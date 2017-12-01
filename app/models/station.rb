class Station < ActiveRecord::Base
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date

  scope :view_order, -> {order(:city, :name)}
  scope :city_groups, -> {group(:city)}
  scope :average_dock_count, -> {average(:dock_count).to_f.round(2)}
  scope :maximum_dock_count, -> {maximum(:dock_count)}
  scope :mininum_dock_count, -> {minimum(:dock_count)}
  scope :max_dock_count_station, -> {order(:dock_count).first}
  scope :min_dock_count_station, -> {order(:dock_count).last}
  scope :newest_station, -> {order(:installation_date).first}
  scope :oldest_station, -> {order(:installation_date).last}

end
