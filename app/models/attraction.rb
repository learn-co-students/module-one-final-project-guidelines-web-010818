class Attraction < ActiveRecord::Base
  has_many :events
  has_many :venues, through: :events
  belongs_to :segment
  belongs_to :genre
end
