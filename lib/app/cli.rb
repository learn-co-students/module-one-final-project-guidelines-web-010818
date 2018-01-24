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
    puts "1. View Your Past Meals"
    puts "2. Enter a New Review"
    puts "3. Search Restaurants"
    puts "4. View All Reviews"
    puts "5. Change User"
    puts "6. Exit"
    input = gets.chomp.to_i

    case input
    when 1
      self.current_user.print_user_reviews
    when 2
      
    end
  end





end
