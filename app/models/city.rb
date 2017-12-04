class City < ActiveRecord::Base
  has_many :condition, foreign_key: :zipcode
end
