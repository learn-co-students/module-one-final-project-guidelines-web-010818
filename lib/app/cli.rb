class Cli < CliMethods
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
      create_user_or_login
    end
  end

  def login
    puts "Please enter your username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    self.current_user = User.find_by(name: username)
  end

  def create_user
    puts "Please enter a new username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
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

    Table.new.display_menu_options
    input = gets.chomp.to_i

    case input
    when 1
      Table.new.display_user_info(self.current_user)
      Table.new.display_user_reviews(self.current_user)
    when 2
      puts "Please enter restaurant name:"
      input = gets.chomp

      restaurants = YelpApiAdapter.user_search_and_display(input, self.current_user.location)
      if restaurants
        puts "Please select restaurant (1-5):"
        input = gets.chomp.to_i
        # select_restaurant_and_return_instance(restaurant, input)
        restaurant = self.current_user.select_restaurant(restaurants, input)
        restaurant = Restaurant.find_or_create_by_instance(restaurant)
        restaurant.display_meals
        puts "#{restaurant.meals.size + 1}. Create new meal"
        input = gets.chomp.to_i
        meal = self.current_user.select_meal(restaurant, input)
        if meal
          get_information_and_create_review_for_existing_meal(restaurant)
          display_menu_options
        elsif input == restaurant.meals.size + 1
          get_information_and_create_review_for_new_meal(restaurant)
          display_menu_options
        else
          puts "Please try again"
          display_menu_options
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
        restaurant = Restaurant.find_or_create_by_instance(restaurant)
        Table.new.display_yelp_reviews
        Table.new.display_mealpal_reviews
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

    when 4

    when 5


    when 6
      exit

    else
      "Enter a valid option (1-6)"
      display_menu_options
    end
  end





end
