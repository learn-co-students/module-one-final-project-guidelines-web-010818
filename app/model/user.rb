class User < ActiveRecord::Base


  def wardrobe
    arr = []
  end


  def hello
    puts "hello"
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def sufficient_funds?(item_id)
    item = Item.all.find_by(item_id: item_id)
    self.balance >= item.price
  end

  def insufficient_funds
    puts "You do not have sufficient funds to complete purchase. Please select from the following options:\n
    1.Add funds to account\n2.Buy another item\n3.Go back to Main Menu"

    response = gets.chomp

    case response
    when 1
      puts "How much would you like to add to your account?"
      amount = gets.chomp
      add_to_balance(amount)
      buy_new_item(item_id, company = mydrobe)
    when 2
      user_buy
    when 3
      main_menu
    end
  end


#this is when the user has come to the end of the 'filtering' questions. At this point the user has selected his/her item.
  def buy_new_item(item_id)
    mydrobe = Company.all.first
    sufficient_funds?(item)
    purchased_item = Item.all.find_by(item_id: item_id)
    store_transaction = StoreTransactions.create(user_id: self.id, item_id:purchased_item.id, transaction_time:Time.now)
    binding.pry
    self.wardrobe << purchased_item
    self.balance-= purchased_item.price
    mydrobe.balance += purchased_item.price
    Item.delete(purchased_item.id)
    puts "Thanks for your order! You shall receive an email confirmation shortly."
  end

  def buy_used_item(item_id)
    mydrobe = Company.all.first
    if sufficient_funds?(item_id)
      purchased_item = Item.all.find_by(item_id: item_id)
      marketplace_transaction = MarketplaceTransactions.create(user_id: self.id, item_id:purchased_item.id, transaction_time:Time.now)
      self.balance -= purchased_item.price
      transaction = MarketplaceTransactions.find_by(item_id: purchased_item.id)
      commission = purchased_item.price * 0.15
      mydrobe.balance += commission
      transaction.user_id.balance += (purchased_item.price - commission)
      #add to user id balance - 15 percent
      Item.delete(purchased_item.id)
    else
      insufficient_funds
    end
  end

  def sell_used_item(name, style, category, size, price)
    item = Item.create(new:false, name:name, style:style, category:category, size:size, price:price)
    MarketplaceTransactions.create(user_id: self.id, item_id: item.id, transaction_time: Time.now)
  end


end
