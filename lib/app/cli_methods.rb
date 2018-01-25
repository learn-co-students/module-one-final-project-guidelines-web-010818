class CliMethods



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

  def return_to_main_menu_interface
    menu_input = nil
    until menu_input == 1
      puts "Enter 1 to return to main menu"
      menu_input = gets.chomp.to_i
    end
    main_menu_interface
  end

  def restaurant_selection_interface
    input = gets.chomp.to_i
    restaurant = self.current_user.select_restaurant(restaurants, input)
    Restaurant.find_or_create_by_instance(restaurant)
  end

end
