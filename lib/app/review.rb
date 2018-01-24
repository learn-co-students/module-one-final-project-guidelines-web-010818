class Review < ActiveRecord::Base

  belongs_to :meal
  belongs_to :user

  def self.find_and_update(user_id:, meal_id:, rating:, content:)
    review = Review.find_by(user_id: user_id, meal_id: meal_id, content: nil )
    review.update(rating: rating, content: content, date: Date.today)
    
  end


  def self.highest_rated_mealpal
    self.all.order(rating: :desc).limit(10)
  end

end
