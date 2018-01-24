class Restaurant < ActiveRecord::Base

  has_many :meals
  has_many :favorites
  has_many :users, through: :favorites



  def display_restaurant_info
    puts " #{self.name}"
    puts "\tAddress: #{self.address}"
    puts "\tPhone Number: #{self.phone_number}"
    puts "\tYelp Rating: #{self.yelp_rating}"
    puts "\tYelp Review Count: #{self.yelp_review_count}"
  end

  def display_meals
    self.meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
    end
  end

  def reviews
    # meals --> self.meals
    # Review.all where meal_id = meal.id
    self.meals.map do |meal|
      meal.reviews.map do |review|
        review
      end
    end.flatten
  end

  def users
    self.reviews.map do |review|
      review.user
    end
  end

  def self.highest_rated_yelp
    max_rating = self.maximum('yelp_rating')
    self.find_by(yelp_rating: max_rating)
  end

end
