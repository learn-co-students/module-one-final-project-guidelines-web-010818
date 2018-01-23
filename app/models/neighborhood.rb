class Neighborhood < ActiveRecord::Base
  has_many :stores
  has_many :clues
end
