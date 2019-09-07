class CreateStoresTable < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.integer :neighborhood_id
      t.string :name
      t.string :witness
    end
  end
end
