class GameStoreClue < ActiveRecord::Base
  has_many :stores
  has_many :clues
  belongs_to :game
end
