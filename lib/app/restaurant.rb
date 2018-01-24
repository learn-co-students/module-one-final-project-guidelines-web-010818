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

  def get_yelp_reviews
    YelpApiAdapter.get_reviews_and_parse(self.yelp_id)
  end

  def display_yelp_reviews
    yelp_reviews = self.get_yelp_reviews
    yelp_reviews.each do |yelp_review|
      puts "Name: #{yelp_review["name"]}"
      puts "Rating: #{yelp_review["rating"]}"
      puts "Date: #{yelp_review["date"]}"
      puts "Text: #{yelp_review["text"]}"
    end
  end

  def display_meal_pal_review
    meal_pal_reviews = self.reviews
    meal_pal_reviews.each do |meal_pal_review|
      puts "Name: #{meal_pal_review.user.name}"
      puts "Rating: #{meal_pal_review.rating}"
      puts "Date: #{meal_pal_review.date}"
      puts "Text: #{meal_pal_review.content}"
    end
  end

  def average_mealpal_review
    review_ratings = self.reviews.map do |review|
      review.rating
    end
    review_ratings.compact.inject{ |sum, el| sum + el }.to_f / review_ratings.compact.size
  end

  def self.top_10_yelp_restaurants
    self.all.order(yelp_rating: :desc).limit(10)
  end
end
