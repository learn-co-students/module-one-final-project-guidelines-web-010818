class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :reviews
  has_many :meals, through: :reviews

  # after_initialize :set_default_values
  #
  # def set_default_values
  #   self.location = "11 Broadway, New York, NY 10004"
  # end

  def print_user_reviews
    self.restaurants.each do |restaurant|
      puts "#{restaurant.name}:"
      restaurant.reviews.each do |review|
        puts "Meal: #{review.meal.name}"
        puts "Rating: #{review.rating}"
        puts "Review: #{review.content}"
      end
    end
  end

  def restaurants
    self.meals.map do |meal|
      meal.restaurant
    end
  end

  def select_restaurant(restaurant_instance_array, input)
    restaurant_instance_array[input - 1]
  end

  def select_meal(restaurant_instance, input)
    restaurant_instance.meals[input - 1]
  end


  def add_review_for_existing_meal(meal:, rating:, content:)
    # restaurant already exists, meal already exists
    self.meals << meal
    Review.find_and_update(user_id: self.id, meal_id: meal.id, rating: rating, content: content)
    meal.restaurant.update(mealpal_rating: meal.restaurant.average_mealpal_review)
    self.update(average_mealpal_rating: self.calculate_average_mealpal_rating, number_of_reviews: self.reviews.size)
  end


  def add_review_for_new_meal(meal_name:, restaurant:, rating:, content:)
    #Restaurant exists, but meal does not
    new_meal = Meal.create(name: meal_name)
    restaurant.meals <<  new_meal
    self.meals << new_meal
    Review.find_and_update(user_id: self.id, meal_id: new_meal.id, rating: rating, content: content)
    restaurant.update(mealpal_rating: restaurant.average_mealpal_review)
    self.update(average_mealpal_rating: self.calculate_average_mealpal_rating, number_of_reviews: self.reviews.size)
  end

  def calculate_average_mealpal_rating
      mealpal_ratings = self.reviews.map do |review|
        review.rating
      end
      mealpal_ratings.compact.inject{ |sum, el| sum + el }.to_f / mealpal_ratings.compact.size
  end

  def display_user_info
    puts "Name: #{self.name}"
    puts "Number of Reviews: #{self.number_of_reviews}"
    puts "Average MealPal Rating: #{self.average_mealpal_rating}"
  end

  def self.most_active
    top_users = self.all.where("number_of_reviews > ?", 0).order(number_of_reviews: :desc).limit(3)
    top_users.each{|user| user.display_user_info}
  end

  def self.most_critical
    critical_users = self.all.where("number_of_reviews > ?", 0).order(average_mealpal_rating: :asc).limit(3)
    critical_users.each{|user| user.display_user_info}
  end
  def self.least_critical
    nice_users = self.all.order(average_mealpal_rating: :desc).limit(3)
    nice_users.each{|user| user.display_user_info}
  end





end
