class Meal < ActiveRecord::Base

  belongs_to :restaurant
  has_many :reviews
  has_many :users, through: :reviews

end
