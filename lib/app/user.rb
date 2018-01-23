class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :reviews
  has_many :meals, through: :reviews
  has_many :restaurants, through: :reviews

  def initialize(name:, location: "11 Broadway, New York, NY 10004")
    @name = name
    @location = location
  end

  



end
