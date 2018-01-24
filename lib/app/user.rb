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
  end


  def add_review_for_new_meal(meal_name:, restaurant:, rating:, content:)
    #Restaurant exists, but meal does not
    new_meal = Meal.create(name: meal_name)
    restaurant.meals <<  new_meal
    self.meals << new_meal
    Review.find_and_update(user_id: self.id, meal_id: new_meal.id, rating: rating, content: content)
    restaurant.update(mealpal_rating: restaurant.average_mealpal_review)
  end




end
