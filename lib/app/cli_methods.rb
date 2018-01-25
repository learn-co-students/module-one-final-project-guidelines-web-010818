class CliMethods

  def get_information_and_create_review_for_existing_meal(restaurant)
    puts "Please enter meal rating:"
    rating = gets.chomp
    puts "Please enter review:"
    content = gets.chomp
    self.current_user.add_review_for_existing_meal(meal: meal, rating: rating, content: content)
  end

  def get_information_and_create_review_for_new_meal(restaurant)
    puts "Please enter meal name:"
    meal_name = gets.chomp
    puts "Please enter meal rating:"
    rating = gets.chomp
    puts "Please enter review:"
    content = gets.chomp
    self.current_user.add_review_for_new_meal(meal_name: meal_name, restaurant: restaurant, rating: rating, content: content)
  end

  def select_restaurant_and_return_instance(restaurant, input)
    restaurant = self.current_user.select_restaurant(restaurants, input)
    restaurant = Restaurant.find_or_create_by_instance(restaurant)
  end

  def search_yelp

  end

  def stats_menu
    Table.new.display_stats_menu
    input = gets.chomp.to_i

    case input
    when 1
      Table.new.display_top_10_yelp
      return_to_previous_menu(&stats_menu)
    when 2
      Table.new.display_top_10_mealpal
      return_to_previous_menu(&stats_menu)
    when 3
      Table.new.display_user_stats(User.most_active, "Most Active Users")
      return_to_previous_menu(&stats_menu)
    when 4
      Table.new.display_user_stats(User.most_critical, "Most Critical Users")
      return_to_previous_menu(&stats_menu)
    when 5
      Table.new.display_user_stats(User.least_critical, "Kindest Users")
      return_to_previous_menu(&stats_menu)
    else
      puts "Input a correct number"
    end
  end

  def return_to_previous_menu(&menu_method)
    menu_input = nil
    until menu_input == 1
      puts "Enter 1 to return to main menu"
      menu_input = gets.chomp.to_i
    end
    menu_method
  end

end
