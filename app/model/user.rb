class User < ActiveRecord::Base


  def hello
    puts "hello"
  end

def new_or_used(stock_number)
  user_selection = Item.all.find_by(id: stock_number)
    if user_selection.new? == true
      buy_new_item(stock_number)
    else
      buy_used_item(stock_number)
    end
  end

#this is when the user has come to the end of the 'filtering' questions. At this point the user has selected his/her item.
  def buy_new_item(item_id)
    mydrobe = Company.all.first
      purchased_item = Item.all.find_by(id: item_id)
      store_transaction = StoreTransactions.create(user_id: self.id, item_id:purchased_item.id, transaction_time:Time.now)
      self.wardrobe << "#{purchased_item.name}.\n".colorize(:red)
      self.save
      self.balance -= purchased_item.price
      self.save
      mydrobe.balance += purchased_item.price
      mydrobe.save
      Item.delete(purchased_item.id)
  end

  def buy_used_item(item_id)
    mydrobe = Company.all.first
      purchased_item = Item.all.find_by(id: item_id)
      transaction = MarketplaceTransactions.find_by(item_id: item_id)
      seller = User.find_by(id: transaction.user_id)
      marketplace_transaction = MarketplaceTransactions.create(user_id: self.id, item_id:purchased_item.id, transaction_time:Time.now)
      self.wardrobe << "#{purchased_item.name}.\n".colorize(:red)
      self.save
      self.balance -= purchased_item.price
      self.save
      #binding.pry
      commission = purchased_item.price * 0.15
      mydrobe.balance += commission
      mydrobe.save
      #binding.pry
    #  binding.pry
      seller.balance += (purchased_item.price - commission)
      seller.save
      #add to user id balance - 15 percent
      Item.delete(purchased_item.id)
  end

  def sell_used_item(name, style, category, size, price)
    item = Item.create(new:false, name:name, style:style, category:category, size:size, price:price)
    MarketplaceTransactions.create(user_id: self.id, item_id: item.id, transaction_time: Time.now)
  end


end
