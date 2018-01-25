class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :reviews
  has_many :meals, through: :reviews

  #User
  def self.create_user_or_login
    input = gets.chomp.to_i
    case input
    when 1
      self.create_user
    when 2
      self.login
    else
      puts "Incorrect Input"
      self.create_user_or_login
    end
  end

  #User
  def self.login
    puts "Please enter your username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    self.find_by(name: username)
  end

  #User
  def self.create_user
    puts "Please enter a new username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    if self.find_by(name: username)
      puts "Username already taken."
      self.create_user
    else
      self.create(name: username)
    end
  end

  #User
  def ask_and_update_location
    if !self.location
      puts "Please set your location: "
      new_location = gets.chomp
      self.update(location: new_location)
      puts "New location saved"
    else
      puts "Your location is set as #{self.location}. Is this still your location?"
      puts " 1. Yes, this is still my location \n 2. Update my location"
      input = gets.chomp.to_i

      case input
      when 1
        puts "Location unchanged"
      when 2
        puts "Enter your new location:"
        new_location = gets.chomp
        self.update(location: new_location)
      else
        puts "Incorrect input."
        ask_location
      end
    end
  end

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
    restaurant_instance_array[input.to_i - 1]
  end

  def select_meal(restaurant_instance, input)
    restaurant_instance.meals[input.to_i - 1]
  end


  def add_review_for_existing_meal(meal:, rating:, content:)
    # restaurant already exists, meal already exists
    self.meals << meal
    Review.find_and_update(user_id: self.id, meal_id: meal.id, rating: rating, content: content)
    meal.restaurant.update(mealpal_rating: meal.restaurant.average_mealpal_review)
    self.update(average_mealpal_rating: self.calculate_average_mealpal_rating, number_of_reviews: self.reviews.size)
    puts "Review created."
    true
  end


  def add_review_for_new_meal(meal_name:, restaurant:, rating:, content:)
    #Restaurant exists, but meal does not
    new_meal = Meal.create(name: meal_name)
    restaurant.meals <<  new_meal
    self.meals << new_meal
    Review.find_and_update(user_id: self.id, meal_id: new_meal.id, rating: rating, content: content)
    restaurant.update(mealpal_rating: restaurant.average_mealpal_review)
    self.update(average_mealpal_rating: self.calculate_average_mealpal_rating, number_of_reviews: self.reviews.size)
    puts "Review created."
    true
  end

  def calculate_average_mealpal_rating
      mealpal_ratings = self.reviews.map do |review|
        review.rating
      end
      mealpal_ratings.compact.inject{ |sum, el| sum + el }.to_f / mealpal_ratings.compact.size
  end

  # def display_user_info
  #   puts "Name: #{self.name}"
  #   puts "Number of Reviews: #{self.number_of_reviews}"
  #   puts "Average MealPal Rating: #{self.average_mealpal_rating}"
  # end

  def self.most_active
    top_users = self.all.where("number_of_reviews > ?", 0).order(number_of_reviews: :desc).limit(3)
    # top_users.each{|user| user.display_user_info}
  end

  def self.most_critical
    critical_users = self.all.where("number_of_reviews > ?", 0).order(average_mealpal_rating: :asc).limit(3)
    # critical_users.each{|user| user.display_user_info}
  end

  def self.least_critical
    nice_users = self.all.where("number_of_reviews > ?", 0).order(average_mealpal_rating: :desc).limit(3)
    # nice_users.each{|user| user.display_user_info}
  end





end
