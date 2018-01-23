class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, id: false do |t|
      t.string :id, primary: true
      t.string :name
      t.datetime :date
      t.timestamps
    end
  end
end
