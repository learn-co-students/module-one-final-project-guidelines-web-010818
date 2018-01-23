class Game < ActiveRecord::Base
  has_many :gamestoreclues
  belongs_to :player
  belongs_to :suspect
end
