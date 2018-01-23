class Store < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :game_store_clues
  has_many :clues, through: :game_store_clues
  has_many :games, through: :game_store_clues
end
