class CreateGameTable < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :neighborhood_id
      t.integer :suspect_id
    end
  end
end
