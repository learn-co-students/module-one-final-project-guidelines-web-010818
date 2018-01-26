class Restaurant < ActiveRecord::Base

  has_many :meals
  has_many :favorites
  has_many :users, through: :favorites

  # def display_restaurant_info
  #   puts " #{self.name}"
  #   puts "\tAddress: #{self.address}"
  #   puts "\tPhone Number: #{self.phone_number}"
  #   puts "\tYelp Rating: #{self.yelp_rating}"
  #   puts "\tYelp Review Count: #{self.yelp_review_count}"
  #   puts "\tMealPal Rating: #{self.mealpal_rating}"
  #   puts "\tMealPal Review Count: #{self.reviews.size}"
  # end

  def display_meals
    self.meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
    end
  end

  def reviews
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

  # def display_yelp_reviews
  #   yelp_reviews = self.get_yelp_reviews
  #   yelp_reviews.each do |yelp_review|
  #     puts "Name: #{yelp_review["name"]}"
  #     puts "Rating: #{yelp_review["rating"]}"
  #     puts "Date: #{yelp_review["date"]}"
  #     puts "Text: #{yelp_review["text"]}"
  #   end
  # end

  # def display_mealpal_reviews
  #   meal_pal_reviews = self.reviews
  #   meal_pal_reviews.each do |meal_pal_review|
  #     puts "Name: #{meal_pal_review.user.name}"
  #     puts "Rating: #{meal_pal_review.rating}"
  #     puts "Date: #{meal_pal_review.date}"
  #     puts "Text: #{meal_pal_review.content}"
  #   end
  # end

  def average_mealpal_review
    review_ratings = self.reviews.map do |review|
      review.rating
    end
    average = review_ratings.compact.inject{ |sum, el| sum + el }.to_f / review_ratings.compact.size
    average.round(1)
  end

  def self.top_10_yelp
    restaurants_array = self.all.where("yelp_rating IS NOT NULL").order(yelp_rating: :desc).limit(10)
    # restaurants_array.each_with_index do |restaurant, index|
    #   print "#{index + 1}. "
    #   restaurant.display_restaurant_info
    # end
  end

  def self.top_10_mealpal
    self.all.where("mealpal_rating IS NOT NULL").order(mealpal_rating: :desc).limit(10)
  end

  def self.find_or_create_by_instance(restaurant_instance)
    found = Restaurant.find_by(yelp_id: restaurant_instance.yelp_id)
    if found
      found
    else
      restaurant_instance.save
      Restaurant.find_by(yelp_id: restaurant_instance.yelp_id)
    end
  end

end
