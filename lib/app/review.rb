class Review < ActiveRecord::Base

  belongs_to :meal
  belongs_to :user

  def self.find_and_update_review(user_id:, meal_id:, rating:, content:)
    review = Review.find_by(user_id: self.id, meal_id: meal.id, content: nil)
    review.update(rating, content)
  end

end
