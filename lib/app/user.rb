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
    self.find_by(name: username) || self.login
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
        ask_and_update_location
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

  def search_yelp
    input = gets.chomp
    YelpApiAdapter.user_search(input, self.location)
  end

  def select_restaurant(restaurant_instance_array, input)
    restaurant_instance_array[input.to_i - 1]
  end

  def select_meal(restaurant_instance, input)
    restaurant_instance.meals[input.to_i - 1]
  end

  def select_or_create_meal(restaurant)
    input = gets.chomp.to_i
    meal = self.select_meal(restaurant, input)
    if meal
      get_information_and_create_review_for_existing_meal(restaurant, meal)
    elsif input == restaurant.meals.size + 1
      get_information_and_create_review_for_new_meal(restaurant)
    else
      puts "Please try again"
      select_or_create_meal(restaurant)
    end
  end

  def get_information_and_create_review_for_existing_meal(restaurant, meal)
    rating = nil
    until rating.is_a?(Fixnum) && rating.between?(1, 5)
      puts "Please enter meal rating (1-2-3-4-5):"
      begin
        rating = Integer(gets)
      rescue ArgumentError
        rating = nil
      end
    end

    puts "Please enter review:"
    content = gets.chomp
    self.add_review_for_existing_meal(meal: meal, rating: rating, content: content)
  end

  def get_information_and_create_review_for_new_meal(restaurant)
    puts "Please enter meal name:"
    meal_name = gets.chomp
    rating = nil
    until rating.is_a?(Fixnum) && rating.between?(1, 5)
      puts "Please enter meal rating (1-2-3-4-5):"
      begin
        rating = Integer(gets)
      rescue ArgumentError
        rating = nil
      end
    end
    puts "Please enter review:"
    content = gets.chomp
    self.add_review_for_new_meal(meal_name: meal_name, restaurant: restaurant, rating: rating, content: content)
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
      average = mealpal_ratings.compact.inject{ |sum, el| sum + el }.to_f / mealpal_ratings.compact.size
      average.round(1)
  end


  def self.most_active
    top_users = self.all.where("number_of_reviews > ?", 0).order(number_of_reviews: :desc).limit(3)
  end

  def self.most_critical
    critical_users = self.all.where("number_of_reviews > ?", 0).order(average_mealpal_rating: :asc).limit(3)
  end

  def self.least_critical
    nice_users = self.all.where("number_of_reviews > ?", 0).order(average_mealpal_rating: :desc).limit(3)
  end





end
