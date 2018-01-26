class Clue < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :game_store_clues
  has_many :games, through: :game_store_clues
  has_many :stores, through: :game_store_clues
end
