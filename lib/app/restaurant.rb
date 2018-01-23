class Restaurant < ActiveRecord::Base

  has_many :meals
  has_many :favorites
  has_many :users, through: :favorites
  has_many :reviews
  has_many :users, through: :reviews

end
