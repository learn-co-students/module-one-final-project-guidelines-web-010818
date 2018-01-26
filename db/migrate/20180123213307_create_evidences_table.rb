class CreateEvidencesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :evidences do |t|
      t.integer :game_id
      t.string :suspect_name
      t.string :gender
      t.string :hair_color
      t.string :eye_color
      t.string :vehicle
      t.string :favorite_food
    end
  end
end
