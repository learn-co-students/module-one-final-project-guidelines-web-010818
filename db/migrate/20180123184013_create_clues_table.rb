class CreateCluesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :clues do |t|
      t.integer :neighborhood_id
      t.string :text
    end
  end
end
