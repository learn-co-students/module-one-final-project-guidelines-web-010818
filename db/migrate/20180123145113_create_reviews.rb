class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :meal_id
      t.integer :rating
      t.text :content
    end
  end
end
