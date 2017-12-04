class Condition < ActiveRecord::Base
  has_many :trip
  belongs_to :city

end
