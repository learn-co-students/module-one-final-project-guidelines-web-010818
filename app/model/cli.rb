require_all 'app'
class Cli
  attr_accessor :current_user

  def initialize
    @current_user = nil
  end

  def welcome
    puts "Welcome to Mydrobe. Would you like to:\n".colorize(:blue) + "1. Create Your Account.\n".colorize(:light_yellow) + "2. Sign In.".colorize(:light_yellow)
    answer = gets.chomp
    if answer == "1"
      create_account
    elsif answer == "2"
      sign_in
    else
      exit
    end
  end

  def create_account
    puts "Please select your username (case sensitive)".colorize(:blue)
    username = gets.chomp
    if username_exists?(username)
      username_exists
    else
      create_user(username)
      puts "Congrats! you have an account now.".colorize(:red)
    end
    main_menu
  end

  def create_user(username)
    puts "Enter the amount you want to add to your account. If you don't want to add money now, enter 0".colorize(:blue)
    balance = gets.chomp
    self.current_user = User.create(name:username, balance:balance)
  end

  def username_exists
    puts "This username is already existed, please choose another one.".colorize(:blue)
    username = gets.chomp
    until !username_exists?(username)
        username_exists
      end
      create_user(username)
  end

  def sign_in
    puts "Please enter your username (case sensitive)".colorize(:blue)
    username = gets.chomp
    if find_user(username)
      self.current_user = find_user(username)[0]
      puts "you are signed in!".colorize(:red)
      main_menu
    else
      puts "username not found! Would you like to:\n".colorize(:blue) + "1. Try again.\n".colorize(:light_yellow) + "2. Create an account?\n".colorize(:light_yellow) + "3. Exit.".colorize(:light_yellow)
      answer = gets.chomp
      if answer == "1"
        sign_in
      elsif answer == "2"
        create_account
      else
        exit
      end
    end
  end

  def username_exists?(username)
    User.all.map{|user| user.name}.include?(username)
  end

  def find_user(username)
    User.where("name = ?", "#{username}")
  end

  def main_menu
    puts "This is MyDrobe main menu\n".colorize(:blue) + "1. Buy\n".colorize(:light_yellow) + "2. Sell\n".colorize(:light_yellow) + "3. Check your balance".colorize(:light_yellow)
    answer = gets.chomp
    if answer == "1"
      user_buy
    elsif answer == "2"
      user_sell
    elsif answer == "3"
      check_balance
    end
  end

  def check_balance
    balance = current_user.balance
    puts "you currently have #{balance} dollars in the account"
    main_menu
  end

  def user_buy
    puts "Are you interested in checking out:\n".colorize(:blue) + "1. New items.\n".colorize(:light_yellow) + "2. Used items\n".colorize(:light_yellow) + "3. Display all".colorize(:light_yellow)
    user_new_old = gets.chomp
    Item.new_or_used(user_new_old)

  #  puts "What would you like to do?\n1."
    puts "What style are you looking for?\n".colorize(:blue) + "1. Street wear.\n".colorize(:light_yellow) + "2. Formal\n".colorize(:light_yellow) + "3. Vintage\n".colorize(:light_yellow) + "4. Display all".colorize(:light_yellow)
    user_style = gets.chomp
    Item.style(user_new_old, user_style)


    puts "What category are you looking for?\n".colorize(:blue) + "1. Top.\n".colorize(:light_yellow) + "2. Bottom\n".colorize(:light_yellow) + "3. Shoes\n".colorize(:light_yellow) + "4. Display all".colorize(:light_yellow)
    user_category = gets.chomp
    Item.category(user_new_old, user_style, user_category).each do |item|
          puts "stock number: #{item.id}, #{item.name}, price: #{item.price} style: #{item.style} category: #{item.category}\n"
        end

    puts "Enter the product number if you wish to purchase the item."
    number = gets.chomp
    purchase_number = number.to_i

    if user_new_old == "1"
      current_user.buy_new_item(purchase_number)
    else
      current_user.buy_used_item(purchase_number)
    end

  end


  def user_sell

    puts "Tell us what you want to sell today. (Item name)".colorize(:blue)
    item_name = gets.chomp

    puts "What is the style?\n".colorize(:blue) + "1. Street wear\n".colorize(:light_yellow) + "2. Vintage\n".colorize(:light_yellow) + "3. Formal".colorize(:light_yellow)
    user_input = gets.chomp
     if user_input == "1"
       item_style = "Street wear"
     elsif user_input == "2"
       item_style = "Vintage"
     elsif user_input == "3"
       item_style = "Formal"
     end

    puts "It is:\n".colorize(:blue) + "1. Top\n".colorize(:light_yellow) + "2. Bottom\n".colorize(:light_yellow) + "3. Shoes".colorize(:light_yellow)
    user_input = gets.chomp
      if user_input == "1"
        item_category = "Top"
      elsif user_input == "2"
        item_category = "Bottom"
      elsif user_input == "3"
        item_category = "Shoes"
      end

    puts "What is the size?\n".colorize(:blue) + "1. Small\n".colorize(:light_yellow) + "2. Medium\n".colorize(:light_yellow) + "3. Large".colorize(:light_yellow)
    user_input = gets.chomp
      if user_input == "1"
        item_size = "Small"
      elsif user_input == "2"
        item_size = "Medium"
      elsif user_input == "3"
        item_size = "Large"
      end

    puts "What is the price? Enter the amount\n *MyDrobe will charge 15% of the listed price as its commission*".colorize(:blue)
    item_price = gets.chomp

    current_user.sell_used_item(item_name, item_style, item_category, item_size, item_price)

    puts "Congrats! your item in on sale now. The money will go to your balance once it is sold.".colorize(:blue)
    puts "🌟#{item_name}, #{item_style}, #{item_category}, #{item_size}, #{item_price}🌟".colorize(:red)
    puts "Do you wish to\n".colorize(:blue) + "1. Return to main menu\n".colorize(:light_yellow) + "2. Check your balance\n".colorize(:light_yellow) + "3. Quit".colorize(:light_yellow)
    user_input = gets.chomp
    if user_input == 1
      main_menu
    elsif user_input == 2
      check_balance
    elsif user_input == 3
      exit
    end
  end










end
