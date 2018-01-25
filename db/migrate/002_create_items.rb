class CreateItems < ActiveRecord::Migration[4.2]

  def change
    create_table :items do |t|
      t.boolean :new
      t.string :name
      t.string :style
      t.string :category
      t.string :size
      t.float :price
    end
  end
end
