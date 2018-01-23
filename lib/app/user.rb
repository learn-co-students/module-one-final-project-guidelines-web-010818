class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :reviews
  has_many :meals, through: :reviews

  after_initialize :set_default_values

  def set_default_values
    self.location = "11 Broadway, New York, NY 10004"
  end



end
