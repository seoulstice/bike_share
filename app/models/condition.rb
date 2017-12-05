class Condition < ActiveRecord::Base
  has_many :trips

  def self.number_of_rides_breakout
    Condition
  end

end


# * Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
