class Item < ActiveRecord::Base
  has_many :users
  has_many :companies
  has_many :marketplace_transactions, through: :users
  has_many :store_transactions, through: :companies

  def self.new_or_used(answer)
    if answer == "1"
      Item.where("new = ?", true)
    elsif answer == "2"
      Item.where("new = ?", false)
    elsif answer == "3"
      Item.all.each do |item|
        puts "stock number: #{item.id}, #{item.name}, price: #{item.price}"
      end
    end
  end

# method not working if no item's found. Have to raise_error.

    def self.style(answer, style)
      if style == "1" #Street wear
        new_or_used(answer).where("style = ?", "Street wear")
      elsif style == "2"
        new_or_used(answer).where("style = ?", "Formal")
      elsif style == "3"
       new_or_used(answer).where("style = ?", "Vintage")
      elsif style == "4"
       new_or_used(answer).each do |item|
        puts "stock number: #{item.id}, #{item.name}, price: #{item.price} style: #{item.style}\n"
       end
     end
    end

    def self.category(answer, style, category)
      if category == "1"
        style(answer, style).where("category = ?", "Top")
      elsif category == "2"
        style(answer, style).where("category = ?", "Bottom")
      elsif category == "3"
        style(answer, style).where("category = ?", "Shoe")
      elsif category == "4"
        style(answer, style)
    end
  end

end
