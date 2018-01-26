class CreateUsers < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :name
      t.float :balance
      t.string :wardrobe
    end
  end
end
