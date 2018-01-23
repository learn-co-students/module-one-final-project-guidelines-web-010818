class CreateGameStoreClues < ActiveRecord::Migration[5.0]
  def change
    create_table :game_store_clues do |t|
      t.integer :game_id
      t.integer :store_id
      t.integer :clue_id
    end
  end
end
