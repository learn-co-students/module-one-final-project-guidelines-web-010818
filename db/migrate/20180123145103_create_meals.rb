class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.integer :restaurant_id
      t.string :name
    end
  end
end
