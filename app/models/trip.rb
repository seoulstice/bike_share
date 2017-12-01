class Trip <ActiveRecord::Base
  belongs_to :stations

  validates_presence_of :duration,
                        :start_date,
                        :start_station,
                        :end_date,
                        :end_station,
                        :bike_id,
                        :subscription_type,
                        :zipcode
end
