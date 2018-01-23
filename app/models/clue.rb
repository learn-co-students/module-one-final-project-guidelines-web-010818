class Clue < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :gamestoreclue
end
