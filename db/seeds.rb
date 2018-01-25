require 'require_all'
require_all 'app'

Item.create(new: true, name: "Yeezy Zebra 350", style: "Street wear", category: "Shoe", size: "11", price: 700.00)
Item.create(new: true, name: "Off-White Tee", style: "Street wear", category: "Top", size: "Large", price: 300.00)
Item.create(new: false, name: "Prada Leather Jacket", style: "Vintage", category: "Top", size: "Small", price: 1300.00)
Item.create(new: true, name: "Supreme x LV Denim Jacket", style: "Street wear", category: "Top", size: "Medium", price: 6000.00)
Item.create(new: true, name: "Tom Ford Blazer", style: "Formal", category: "Top", size: "Medium", price: 1200.00)
Item.create(new: true, name: "Adidas X Jeremy Scott Foil Wing", style: "Street wear", category: "Shoe", size: "9", price: 250.00)
Item.create(new: true, name: "Jimmy Choo Viola 110", style: "Formal", category: "Shoe", size: "7", price: 1100.00)
Item.create(new: true, name: "Burberry Button Up", style: "Formal", category: "Top", size: "Large", price: 400.00)
Item.create(new: true, name: "Jordan Varsity Jacket", style: "Street wear", category: "Top", size: "Large", price: 250.00)
Item.create(new: true, name: "Balenciaga C Parka", style: "Street wear", category: "Top", size: "Small", price: 2200.00)


Item.create(new: false, name: "Supreme Perfecto Tassel Sweatpants", style: "Street wear", category: "Bottom", size: "Large", price: 200.00)
Item.create(new: true, name: "Nike Lab ACG Fleece Hoodie", style: "Street wear", category: "Top", size: "Medium", price: 240.00)
Item.create(new: true, name: "Waffles N Cream Orange Trouser", style: "Street wear", category: "Top", size: "Large", price: 40.00)
Item.create(new: true, name: "Alexander Wang Page Six Long Sleeve", style: "Street wear", category: "Top", size: "Medium", price: 250.00)
Item.create(new: true, name: "Ermenegildo Zegna Drawstring Trousers", style: "Formal", category: "Bottom", size: "Medium", price: 275.00)
Item.create(new: true, name: "Raf Simons Black Waistband Shorts", style: "Vintage", category: "Bottom", size: "Medium", price: 200.00)
Item.create(new: true, name: "PostImperial Lagos Pants", style: "Vintage", category: "Top", size: "Small", price: 325.00)
Item.create(new: true, name: "PostImperial Lagos Sweatshirt", style: "Vintage", category: "Top", size: "Medium", price: 100.00)
Item.create(new: true, name: "Off-White Diagonal Stripe T-Shirt", style: "Street wear", category: "Top", size: "Medium", price: 303.00)
Item.create(new: true, name: "Alexander Wang Football Hybrid Hoodie", style: "Street wear", category: "Top", size: "Medium", price: 300.00)


Item.create(new: true, name: "Off-White Pullover Jacket", style: "Street wear", category: "Top", size: "Large", price: 1270.00)
Item.create(new: true, name: "Gucci Tiger Print T-shirt", style: "Vintage", category: "Top", size: "Large", price: 680.00)
Item.create(new: true, name: "Dsquared2 Tuxedo Jacket", style: "Formal", category: "Top", size: "Small", price: 1860.00)
Item.create(new: true, name: "Maison Margiela Dinner Jacket", style: "Formal", category: "Top", size: "Medium", price: 2265.00)
Item.create(new: true, name: "Yeezy Faux Shearling Denim Jacket", style: "Street wear", category: "Top", size: "Small", price: 600.00)
Item.create(new: true, name: "Versace Vintage Straight Leg Jeans", style: "Vintage", category: "Bottom", size: "Medium", price: 368.00)
Item.create(new: true, name: "Yohji Yamamoto Vintage Drop Crotch Shorts", style: "Vintage", category: "Bottom", size: "Medium", price: 382.00)
Item.create(new: true, name: "Comme Des Garçons Vintage Zip Front Vest", style: "Vintage", category: "Top", size: "Large", price: 281.00)
Item.create(new: true, name: "Givenchy Classic Derby Shoes", style: "Formal", category: "Shoe", size: "10", price: 537.00)
Item.create(new: true, name: "Alexander Mcqueen Oversized Sneakers", style: "Street wear", category: "Shoe", size: "11", price: 375.00)


fara = User.create(name: "Fara", balance: 100.00, wardrobe: "")
prada_jacket = MarketplaceTransactions.create(user_id:1 , item_id:3, transaction_time:Time.now)
supreme_sweatpants = MarketplaceTransactions.create(user_id:1 , item_id:11, transaction_time:Time.now)

Company.create(name:"Dumbo", balance: 0.00)

puts "HEY I SEEDED"
