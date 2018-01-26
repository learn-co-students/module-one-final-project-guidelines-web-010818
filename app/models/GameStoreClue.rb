class GameStoreClue < ActiveRecord::Base
  belongs_to :store
  belongs_to :clue
  belongs_to :game
end
