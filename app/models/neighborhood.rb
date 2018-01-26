class Neighborhood < ActiveRecord::Base
  has_many :stores
  has_many :clues
  has_many :games
end
