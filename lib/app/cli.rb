class Cli
  attr_accessor :current_user

  def initialize
    @current_user = nil
  end

  def run
    welcome
    ask_location
    display_menu_options
  end

  def welcome
    puts "Welcome to the MealPal Rating App"
    create_user_or_login
  end

  def create_user_or_login
    puts " 1. New User \n 2. Returning User"
    input = gets.chomp.to_i
    case input
    when 1
      create_user
    when 2
      login
    else
      puts "Incorrect Input"
      new_or_existing_user
    end
  end

  def login
    puts "Please enter your username: "
    username = gets.chomp
    self.current_user = User.find_by(name: username)
  end

  def create_user
    puts "Please enter a new username: "
    username = gets.chomp
    if User.find_by(name: username)
      puts "Username already taken."
      create_user
    else
      self.current_user = User.create(name: username)
    end
  end

  def ask_location
    if !self.current_user.location
      puts "Please set your location: "
      new_location = gets.chomp
      self.current_user.update(location: new_location)
      puts "New location saved"
    else
      puts "Your location is set as #{self.current_user.location}. Is this still your location?"
      puts " 1. Yes, this is still my location \n 2. Update my location"
      input = gets.chomp.to_i

      case input
      when 1
        puts "Location unchanged"
      when 2
        puts "Enter your new location:"
        new_location = gets.chomp
        self.current_user.update(location: new_location)
      else
        puts "Incorrect input."
        ask_location
      end
    end
  end

  def display_menu_options
    puts "1. View Your Past Meals and Reviews"
    puts "2. Enter a New Review"
    puts "3. Search Yelp"
    puts "4. View All Reviews"
    puts "5. Change User"
    puts "6. Exit"
    input = gets.chomp.to_i

    case input
    when 1
      self.current_user.display_user_info
      self.current_user.print_user_reviews
      display_menu_options
    when 2
      puts "Please enter restaurant name:"
      input = gets.chomp

      restaurants = YelpApiAdapter.user_search_and_display(input, self.current_user.location)
      if restaurants
        puts "Please select restaurant (1-5):"
        input = gets.chomp.to_i
        restaurant = self.current_user.select_restaurant(restaurants, input)
        restaurant = Restaurant.find_or_create_by(restaurant.attributes.delete_if{|k,v| k == "id"})
        restaurant.display_meals
        puts "#{restaurant.meals.size + 1}. Create new meal"
        input = gets.chomp.to_i
        meal = self.current_user.select_meal(restaurant, input)
        if meal
          puts "Please enter meal rating:"
          rating = gets.chomp
          puts "Please enter review:"
          content = gets.chomp
          self.current_user.add_review_for_existing_meal(meal: meal, rating: rating, content: content)
        elsif input == restaurant.meals.size + 1
          puts "Please enter meal name:"
          meal_name = gets.chomp
          puts "Please enter meal rating:"
          rating = gets.chomp
          puts "Please enter review:"
          content = gets.chomp
          self.current_user.add_review_for_new_meal(meal_name: meal_name, restaurant: restaurant, rating: rating, content: content)
        else
          puts "Please try again"
          #call method to start review process again here
        end
      else
        puts "No results found. Please search again."
        display_menu_options
      end
    when 3
      puts "Search Yelp: "
      input = gets.chomp
      restaurants = YelpApiAdapter.user_search_and_display(input, self.current_user.location)

      if restaurants
        puts "Please select restaurant (1-5):"
        input = gets.chomp.to_i
        restaurant = self.current_user.select_restaurant(restaurants, input)
        restaurant = Restaurant.find_or_create_by(restaurant.attributes.delete_if{|k,v| k == "id" || k == "mealpal_rating"})
        restaurant.display_yelp_reviews
        binding.pry
        restaurant.display_mealpal_reviews
        # refactor to have method to add review
        puts "Enter 1 to return to main menu"
        input = gets.chomp.to_i
        if input == 1
          display_menu_options
        end
      else
        puts "Please try again"
        display_menu_options
        #call method to start review process again here
      end






    when 6
      exit
    end
  end





end
