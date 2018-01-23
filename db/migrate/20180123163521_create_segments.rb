class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments, id: false do |t|
      t.string :id, primary: true
      t.string :name
      t.timestamps
    end
  end
end
