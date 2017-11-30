class Station < ActiveRecord::Base
  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date

  def self.count
    count
  end

  # def self.average_dock_count
  #     find_by_sql('SELECT AVG(dock_count)
  #                        FROM stations')
  # end

  def self.average_dock_count
    average(:dock_count).to_f.round(2)
  end

  def self.maximum_dock_count
    maximum(:dock_count)
  end

  def self.mininum_dock_count
    minimum(:dock_count)
  end

  def self.max_dock_count_station
    order(:dock_count).first.name
  end

  def self.min_dock_count_station
    order(:dock_count).last.name
  end

  def self.newest_station
    order(:installation_date).first.name
  end

  def self.oldest_station
    order(:installation_date).last.name
  end
end
