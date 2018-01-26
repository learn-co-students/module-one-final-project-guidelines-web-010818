class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, id: false do |t|
      t.string :id, primary: true
      t.string :name
      t.datetime :dateTime
      t.string :venue_id
      t.string :attraction_id
      t.timestamps
    end
  end
end
