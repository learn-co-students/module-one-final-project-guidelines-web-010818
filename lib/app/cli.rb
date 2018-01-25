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
    self.previous_menu = __method__
    Table.new.display_main_menu
    input = gets.chomp.to_i

    case input
    when 1
      Table.new.display_user_info(self.current_user)
      Table.new.display_user_reviews(self.current_user)
      return_to_previous_menu_interface
    when 2
      review_interface
    when 3
      search_yelp_interface
    when 4
      stats_menu_interface
    when 5
      run
    when 6
      exit
    else
      puts "Enter a valid option"
      main_menu_interface
    end
  end





end
