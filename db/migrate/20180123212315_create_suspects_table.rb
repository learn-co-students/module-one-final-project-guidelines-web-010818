class CreateSuspectsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :suspects do |t|
      t.string :name
      t.string :gender
      t.string :hair_color
      t.string :eye_color
      t.string :vehicle
      t.string :favorite_food
    end
  end
end
