class Cli < CliMethods
  attr_accessor :current_user, :previous_menu

  def initialize
    @current_user = nil
    @previous_menu = nil
  end

  def run
    puts "Welcome to the MealPal Rating App"
    puts " 1. New User \n 2. Returning User"
    self.current_user = User.create_user_or_login
    self.current_user.ask_and_update_location
    main_menu_interface

  end

  def main_menu_interface

    Table.new.display_main_menu
    input = gets.chomp.to_i

    case input
    when 1
      Table.new.display_user_info(self.current_user)
      Table.new.display_user_reviews(self.current_user)
      return_to_main_menu_interface
    when 2
      puts "Please enter restaurant name:"
      restaurants = self.current_user.search_yelp
      # User selects a restaurant from Yelp List. CLI displays existing restaurant meals
      # and the option to create a new meal. CLI gets user input to create a review for meal.
      if restaurants
        puts "Please select restaurant (1-5):"
        restaurant = restaurant_selection_interface
        puts "Meal options:"
        restaurant.display_meals
        puts "#{restaurant.meals.size + 1}. Create new meal"
        puts "Enter a number to make your selection."
        self.current_user.select_or_create_meal(restaurant)
        return_to_main_menu_interface
      else
        puts "No results found. Please search again."
        return_to_main_menu_interface
      end

    when 3
      puts "Search Yelp: "
      restaurants = self.current_user.search_yelp

      if restaurants
        puts "Please select restaurant (1-5):"
        restaurant = restaurant_selection_interface

        Table.new.display_yelp_reviews(restaurant)
        Table.new.display_mealpal_reviews(restaurant)
        # refactor to have method to add review
        return_to_main_menu_interface
      else
        puts "Please try again"
        return_to_main_menu_interface

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
      return_to_main_menu_interface
    end
  end





end
