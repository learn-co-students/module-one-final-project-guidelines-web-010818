class Game < ActiveRecord::Base
  has_many :game_store_clues
  belongs_to :player
  belongs_to :suspect
  belongs_to :neighborhood
  has_many :stores, through: :game_store_clues
  has_many :clues, through: :game_store_clues

  def add_player
    # #Associate player with game
    # tom.games << game
    # tom.save

  end

  # #Associate game, store, and clue to GameStoreClue
  # gsc = GameStoreClue.create(game: game, store: s, clue: c)
  # gsc2 = GameStoreClue.create(game: game, store: s2, clue: c2)

  # #Associate neighborhood with store and clue
  # n.stores << s
  # n.stores << s2
  # n.clues << c
  # n.clues << c2
  # game.neighborhood = n
  # game.save

end
