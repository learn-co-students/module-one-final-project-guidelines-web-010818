class Cli < CliMethods
  attr_accessor :current_user

  def initialize
    @current_user = nil
    @previous_menu = nil
  end

  # def run
  #   welcome
  #   ask_location
  #   display_menu_options
  # end

  def run
    puts "Welcome to the MealPal Rating App"
    puts " 1. New User \n 2. Returning User"
    self.current_user = User.create_user_or_login
    self.current_user.ask_and_update_location
    binding.pry
    # puts " 1. Yes, this is still my location \n 2. Update my location"
    # update_location
  end

  def display_menu_options

    Table.new.display_main_menu
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
        binding.pry
        Table.new.display_yelp_reviews(restaurant)
        Table.new.display_mealpal_reviews(restaurant)
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
      stats_menu
      # Table.new.display_stats_menu
      # input = gets.chomp.to_i
      #
      # case input
      # when 1
      #   Table.new.display_top_10_yelp
      # when 2
      #   Table.new.display_top_10_mealpal
      # when 3
      #   Table.new.display_user_stats(User.most_active, "Most Active Users")
      # when 4
      #   Table.new.display_user_stats(User.most_critical, "Most Critical Users")
      # when 5
      #   Table.new.display_user_stats(User.least_critical, "Kindest Users")
      # else
      #   puts "Input a correct number"
      # end


    when 5


    when 6
      exit

    else
      "Enter a valid option (1-6)"
      display_menu_options
    end
  end





end
