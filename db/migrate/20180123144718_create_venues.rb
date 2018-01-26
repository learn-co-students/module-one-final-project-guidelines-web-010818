class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues, id: false do |t|
      t.string :id, primary: true
      t.string :name
      t.string :city
      t.string :state_code
      t.timestamps
    end
  end
end
