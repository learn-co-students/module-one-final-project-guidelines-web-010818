class AddMealpalRatingToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :mealpal_rating, :float
  end
end
