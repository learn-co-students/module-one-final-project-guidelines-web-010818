class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :yelp_rating
      t.float :latitude
      t.float :longitude
      t.integer :yelp_review_count
    end
  end
end
