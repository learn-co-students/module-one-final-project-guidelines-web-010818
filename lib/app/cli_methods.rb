class CliMethods



  def select_restaurant_and_return_instance(restaurant, input)
    restaurant = self.current_user.select_restaurant(restaurants, input)
    restaurant = Restaurant.find_or_create_by_instance(restaurant)
  end

  def stats_menu_interface
    self.previous_menu = __method__
    Table.new.display_stats_menu
    input = gets.chomp.to_i

    case input
    when 1
      Table.new.display_top_10_yelp
      return_to_previous_menu_interface
    when 2
      Table.new.display_top_10_mealpal
      return_to_previous_menu_interface
    when 3
      Table.new.display_user_stats(User.most_active, "Most Active Users")
      return_to_previous_menu_interface
    when 4
      Table.new.display_user_stats(User.most_critical, "Most Critical Users")
      return_to_previous_menu_interface
    when 5
      Table.new.display_user_stats(User.least_critical, "Kindest Users")
      return_to_previous_menu_interface
    else
      puts "Input a correct number"
      stats_menu_interface
    end

  end

  def return_to_stats_menu
    menu_input = nil
    until menu_input == 0
      puts "Enter 0 to return to main menu"
      menu_input = gets.chomp.to_i
    end
    stats_menu_interface
  end

  def review_interface
    self.previous_menu = __method__
    puts "Please enter restaurant name:"
    restaurants = self.current_user.search_yelp
    restaurants.map! do |restaurant|
      found = Restaurant.find_by(yelp_id: restaurant.yelp_id)
      if found
        found
      else
        restaurant
      end
    end
    Table.new.display_restaurants(restaurants)
    # User selects a restaurant from Yelp List. CLI displays existing restaurant meals
    # and the option to create a new meal. CLI gets user input to create a review for meal.
    if restaurants
      puts "Please select restaurant (1-5):"
      restaurant = restaurant_selection_interface(restaurants)
      puts "Meal options:"
      restaurant.display_meals
      puts "#{restaurant.meals.size + 1}. Create new meal"
      puts "Enter a number to make your selection."
      meal = self.current_user.select_or_create_meal(restaurant)
      return_to_previous_menu_interface
    else
      puts "No results found. Please search again."
      return_to_previous_menu_interface
    end
  end

  def search_yelp_interface
    self.previous_menu = __method__
    puts "Search Yelp based on your location: "
    restaurants = self.current_user.search_yelp

    if restaurants

      restaurants.map! do |restaurant|
        found = Restaurant.find_by(yelp_id: restaurant.yelp_id)
        if found
          found
        else
          restaurant
        end
      end

      Table.new.display_restaurants(restaurants)

      puts "Please select restaurant (1-5):"

      restaurant = restaurant_selection_interface(restaurants)

      Table.new.display_yelp_reviews(restaurant)
      Table.new.display_mealpal_reviews(restaurant)
      # refactor to have method to add review
      return_to_previous_menu_interface
    else
      puts "Please try again"
      return_to_previous_menu_interface
    end
  end

  def return_to_previous_menu_interface
    menu_input = nil
    until menu_input == "0" || menu_input == "m"
      puts "Enter 0 to return to previous menu or M to return to main menu"
      menu_input = gets.chomp
    end
    if menu_input == "0"
      send(previous_menu)
    elsif menu_input.downcase == "m"
      main_menu_interface
    end

  end

  def restaurant_selection_interface(restaurants)
    input = gets.chomp.to_i
    restaurant = self.current_user.select_restaurant(restaurants, input)
    Restaurant.find_or_create_by_instance(restaurant)
  end

end
