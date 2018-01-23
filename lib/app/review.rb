class Review < ActiveRecord::Base

  belongs_to :meal
  belongs_to :restaurant
  belongs_to :user 

end
