class AddPostsAndMealpalRatingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :number_of_reviews, :integer
    add_column :users, :average_mealpal_rating, :float
  end
end
