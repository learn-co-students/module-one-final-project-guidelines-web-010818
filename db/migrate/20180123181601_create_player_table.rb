class CreatePlayerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :rank
    end
  end
end
