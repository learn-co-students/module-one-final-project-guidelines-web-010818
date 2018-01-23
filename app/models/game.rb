class Game < ActiveRecord::Base
  has_many :game_store_clues
  belongs_to :player
  belongs_to :suspect
  belongs_to :neighborhood
  has_many :stores, through: :game_store_clues
  has_many :clues, through: :game_store_clues

  attr_accessor :current_location, :last_correct_location
  # Should start game location at locations[0]

  def welcome
    puts "Welcome!"
  end

  def find_or_create_player

  end

  def add_player
    # #Associate player with game
    # tom.games << game
    # tom.save

  end

  def locations ## Maybe 10?
    current_location = location_array[0]
    last_correct_location = location_array[0]
    #Return array of locations
  end

  def add_clues_to_stores
    # Will need to pick random clues for each item in random_locations array using location.clues
    # Iterate over random_locations, then over locations.stores and assign a location.clues
    # Use location.shuffle
    # #Associate game, store, and clue to GameStoreClue
    # GameStoreClue.create(game: game, store: s, clue: c)
  end

  def pick_suspect
    #random number and grab index from suspect array
    #Associate suspect to game and save
  end

  def update_location
    # if new location chosen from menu matches locations[n+1], then current_location
    # and last_correct_location are updated
    # game.neighborhood = n
    # game.save
  end

  def player_menu

  end

  def travel

  end

  def evidence

  end

  def interview

  end

  def exit_game

  end
end
