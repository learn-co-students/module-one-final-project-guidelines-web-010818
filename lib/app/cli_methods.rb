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
end
