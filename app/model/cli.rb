require_all 'app'
class Cli
  attr_accessor :current_user

  def initialize
    @current_user = nil
  end

  def welcome
    puts "Welcome to Dumbo. Would you like to:\n".colorize(:light_green) + "1. Create Your Account.\n".colorize(:light_yellow) + "2. Sign In.".colorize(:light_yellow)
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
    puts "Please create your username (case sensitive)".colorize(:light_green)
    username = gets.chomp
    if username_exists?(username)
      username_exists
    else
      create_user(username)
    end
  end

  def create_user(username)
    puts "Enter the amount you want to add to your account. If you don't want to add money now, enter 0".colorize(:light_green)
    balance = gets.chomp
    self.current_user = User.create(name:username, balance:balance, wardrobe: "")
    puts "Congrats! you have an account now. Your balance is $#{current_user.balance}".colorize(:red)
    main_menu
  end

  def username_exists
    puts "This username already exists, please choose another one.".colorize(:light_green)
    username = gets.chomp
    until !username_exists?(username)
        username_exists
      end
      create_user(username)
  end

  def sign_in
    puts "Please enter your username (case sensitive)".colorize(:light_green)
    username = gets.chomp
    if username_exists?(username)
      self.current_user = find_user(username)[0]
      #binding.pry
      puts "you are signed in!".colorize(:red)
      main_menu
    else
      puts "username not found! Would you like to:\n".colorize(:light_green) + "1. Try again.\n".colorize(:light_yellow) + "2. Create an account?\n".colorize(:light_yellow) + "3. Exit.".colorize(:light_yellow)
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
    puts "\nThis is Dumbo main menu\n".colorize(:light_green) + "1. Buy\n".colorize(:light_yellow) + "2. Sell\n".colorize(:light_yellow) + "3. Check your balance\n".colorize(:light_yellow) + "4. Add to balance\n".colorize(:light_yellow) + "5. Check your wardrobe\n".colorize(:light_yellow) + "6. Exit".colorize(:light_yellow)
    answer = gets.chomp
    if answer == "1"
      user_buy
    elsif answer == "2"
      user_sell
    elsif answer == "3"
      check_balance
    elsif answer == "4"
      add_balance
    elsif answer == "5"
      check_wardrobe
    elsif answer == "6"
      puts "Come back soon! Goodbye".colorize(:light_cyan)
      exit
    end
  end

  def check_wardrobe
    wardrobe = current_user.wardrobe
    if wardrobe.empty?
      puts "Your wardrobe is empty!".colorize(:red)
    else
      puts "#{wardrobe}".colorize(:red)
    end

    main_menu
  end

  def check_balance
    balance = current_user.balance
    puts "💰  you currently have $#{balance} in the account 💰\n".colorize(:red)
    main_menu
  end

  def add_balance
    puts "Enter the amount you want to add to the balance".colorize(:light_green)
    amount = gets.chomp.to_f
    current_user.balance += amount
    current_user.save
    puts "Your new balance is $#{current_user.balance}".colorize(:red)
    main_menu
  end

  def user_buy
    puts "Are you interested in checking out:\n".colorize(:light_green) + "1. New items.\n".colorize(:light_yellow) + "2. Used items\n".colorize(:light_yellow) + "3. Display all".colorize(:light_yellow)
    user_new_old = gets.chomp
    Item.new_or_used(user_new_old)
    if user_new_old == "3"
      user_purchase
    end

    puts "What style are you looking for?\n".colorize(:light_green) + "1. Street wear.\n".colorize(:light_yellow) + "2. Formal\n".colorize(:light_yellow) + "3. Vintage\n".colorize(:light_yellow) + "4. Display all".colorize(:light_yellow)
    user_style = gets.chomp
    style = Item.style(user_new_old, user_style)
#change
    if style.empty?
      puts "There are no items matching your preferences. Press any key to go back to the main menu"
      answer = gets.chomp
      if answer
        main_menu
      end
    end

    if user_style == "4"
      user_purchase
    end

    puts "What category are you looking for?\n".colorize(:light_green) + "1. Top.\n".colorize(:light_yellow) + "2. Bottom\n".colorize(:light_yellow) + "3. Shoes\n".colorize(:light_yellow) + "4. Display all".colorize(:light_yellow)
    user_category = gets.chomp
    category = Item.category(user_new_old, user_style, user_category).each do |item|
          puts "stock number: #{item.id}, #{item.name}, price: $#{item.price} style: #{item.style} category: #{item.category}\n".colorize(:white)
        end
#change
    if category.empty?
      puts "There are no items matching your preferences. Press any key to go back to the main menu"
      answer = gets.chomp
      if answer
        main_menu
      end
    end
    user_purchase

  end

  def user_purchase
    puts "Enter the stock number if you wish to purchase an item. Enter 0 if you wish to go back".colorize(:light_green)
    number = gets.chomp
    purchase_number = number.to_i
    if purchase_number == 0
      user_buy
    else
      sufficient_funds(purchase_number)
      # current_user.new_or_used(purchase_number)#need to build this method buy_item in user class
      # puts "Thank you for your purchase. You will receive a confirmation email shortly. Now redirecting to main menu"
      # main_menu
    end
  end

  def sufficient_funds(item_id)
    if sufficient_funds?(item_id)
      current_user.new_or_used(item_id)#need to build this method buy_item in user class
      puts "Thank you for your purchase. You will receive a confirmation email shortly. Now redirecting to main menu".colorize(:red)
      main_menu
    else
      insufficient_funds
    end

  end

  def sufficient_funds?(item_id)
    item = Item.all.find_by(id: item_id)
    current_user.balance >= item.price
  end

  def insufficient_funds
    puts "You do not have sufficient funds to complete purchase. Please select from the following options:\n".colorize(:light_green) + "1. Add funds to account\n".colorize(:light_yellow) + "2. Buy another item\n".colorize(:light_yellow) +"3. Go back to Main Menu".colorize(:light_yellow)

    response = gets.chomp

    case response
    when "1"
      puts "How much would you like to add to your account?".colorize(:light_green)
      amount = gets.chomp
      current_user.balance += amount.to_f
      current_user.save
      puts "Now you have $#{current_user.balance}. Redirecting to main memu".colorize(:red)
      main_menu
    when "2"
      user_buy
    when "3"
      main_menu
    end
  end

  # def purchase_new_or_old
  #   if user_new_old == "1"
  #     current_user.buy_new_item(purchase_number)
  #   else
  #     current_user.buy_used_item(purchase_number)
  #   end
  # end


  def user_sell
    puts "Tell us what you want to sell today. (Item name)".colorize(:light_green)
    item_name = gets.chomp

    puts "What is the style?\n".colorize(:light_green) + "1. Street wear\n".colorize(:light_yellow) + "2. Vintage\n".colorize(:light_yellow) + "3. Formal".colorize(:light_yellow)
    user_input = gets.chomp
     if user_input == "1"
       item_style = "Street wear"
     elsif user_input == "2"
       item_style = "Vintage"
     elsif user_input == "3"
       item_style = "Formal"
     end

    puts "It is:\n".colorize(:light_green) + "1. Top\n".colorize(:light_yellow) + "2. Bottom\n".colorize(:light_yellow) + "3. Shoes".colorize(:light_yellow)
    user_input = gets.chomp
      if user_input == "1"
        item_category = "Top"
      elsif user_input == "2"
        item_category = "Bottom"
      elsif user_input == "3"
        item_category = "Shoes"
      end

    puts "What is the size?\n".colorize(:light_green) + "1. Small\n".colorize(:light_yellow) + "2. Medium\n".colorize(:light_yellow) + "3. Large".colorize(:light_yellow)
    user_input = gets.chomp
      if user_input == "1"
        item_size = "Small"
      elsif user_input == "2"
        item_size = "Medium"
      elsif user_input == "3"
        item_size = "Large"
      end

    puts "What is the price? Enter the amount\n *Dumbo will charge 15% of the listed price as its commission*".colorize(:light_green)
    item_price = gets.chomp.to_f


    current_user.sell_used_item(item_name, item_style, item_category, item_size, item_price)

    puts "Congrats! your item in on sale now. The money will go to your balance once it is sold.".colorize(:light_green)
    puts "🌟 #{item_name}, #{item_style}, #{item_category}, #{item_size}, $#{item_price}🌟".colorize(:red)
    puts "Do you wish to\n".colorize(:light_green) + "1. Return to main menu\n".colorize(:light_yellow) + "2. Check your balance\n".colorize(:light_yellow) + "3. Quit".colorize(:light_yellow)
    user_input = gets.chomp
    if user_input == "1"
      main_menu
    elsif user_input == "2"
      check_balance
    elsif user_input == "3"
      exit
    end
  end










end
