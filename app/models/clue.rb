class Clue < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :gamestoreclue
end
