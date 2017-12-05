class Condition < ActiveRecord::Base
  has_many :trips

  def self.find_condition_id(date)
    
  end


end
