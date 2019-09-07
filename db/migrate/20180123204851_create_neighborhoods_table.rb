class CreateNeighborhoodsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
    end
  end
end
