class Game < ActiveRecord::Base
  has_many :game_store_clues
  belongs_to :player
  belongs_to :suspect
  belongs_to :neighborhood
  has_many :stores, through: :game_store_clues
  has_many :clues, through: :game_store_clues

  attr_accessor :current_neighborhood, :last_correct_neighborhood, :neighborhoods
  # Should start game neighborhood at neighborhoods[0]

  def generate_new_game_data
    associate_game_store_clue_entries(generate_random_neighborhoods)
    current_neighborhood = neighborhoods[0]
    last_correct_neighborhood = neighborhoods[0]
    self.neighborhood = current_neighborhood
    pick_suspect
    self.save
  end

  def generate_random_neighborhoods ## Maybe 10?
    #Return array of neighborhoods
    self.neighborhoods = Neighborhood.all.shuffle[0..9]
  end

  def associate_game_store_clue_entries(neighborhoods)
    neighborhoods.each do |n|
      clues = n.clues.shuffle[0..2]
      i = 0
      n.stores.each do |s|
        gsc = GameStoreClue.create()
        self.game_store_clues << gsc
        s.game_store_clues << gsc
        clues[i].game_store_clues << gsc
        i += 1
      end
    end
  end

  # def neighborhoods
  #   current_neighborhood = neighborhood_array[0]
  #   last_correct_neighborhood = neighborhood_array[0]
  # end

  def pick_suspect
    #random number and grab index from suspect array
    random_index = rand(0..15)
    self.suspect = Suspect.all[random_index]
  end

  def update_neighborhood
    # if new neighborhood chosen from menu matches neighborhoods[n+1], then current_neighborhood
    # and last_correct_neighborhood are updated
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
