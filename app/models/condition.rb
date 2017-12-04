class Condition < ActiveRecord::Base
  has_many :trips, primary_key: :date, foreign_key: :start_date

end
