class Segment < ActiveRecord::Base
  has_many :attractions
  has_many :events, through: :attractions
end
