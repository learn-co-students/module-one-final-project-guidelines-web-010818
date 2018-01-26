class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions, id: false do |t|
      t.string :id, primary: true
      t.string :name
      t.string :segment_id
      t.string :genre_id
      t.timestamps
    end
  end
end
