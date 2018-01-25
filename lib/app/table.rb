class Table
  include CommandLineReporter

  def display_menu_options
    table(border: true) do
     row header: true do
       column('MEALPAL RATINGS APP', width: 50)
     end
     row do
       column('1. View Your View Your Past Meals and Reviews', align: 'left')
     end
     row do
       column('2. Enter a New Review')
     end
     row do
       column('3. Search Yelp')
     end
     row do
       column('4. View All Reviews')
     end
     row do
       column('5. Logout')
     end
     row do
       column('6. Exit')
     end
   end
  end

  def display_restaurants(array)
    table(border: true) do
     row header: true do
       column('NAME', width: 17)
       column('ADDRESS', width: 21)
       column('PHONE #', width: 14, align: 'center')
       column('YELP  RATING', width: 6, align: 'center')
       column('# OF YELP REVIEWS', width: 10, align: 'center')
       column('MEALPAL RATING', width: 7, align: 'center')
       column('# OF MEALPAL REVIEWS', width: 12, align: 'center')
     end
     array.each_with_index do |restaurant, index|
       row do
         column("#{index+1}. #{restaurant.name}")
         column("#{restaurant.address}")
         column("#{restaurant.phone_number}")
         column("#{restaurant.yelp_rating}")
         column("#{restaurant.yelp_review_count}")
         column("#{restaurant.mealpal_rating}")
         column("#{restaurant.reviews.size}")
       end
     end
    end
  end

  def display_yelp_reviews
    yelp_reviews = self.get_yelp_reviews
    yelp_reviews.each do |yelp_review|
      puts "Name: #{yelp_review["name"]}"
      puts "Rating: #{yelp_review["rating"]}"
      puts "Date: #{yelp_review["date"]}"
      puts "Text: #{yelp_review["text"]}"
    end
  end

  def display_user_reviews(user)
    table(border: true) do
     row header: true do
       column('DATE', width: 10)
       column('MEAL', width: 8)
       column('RATING', width: 6, align: 'center')
       column('TEXT', width: 35)
     end
     user.reviews.each_with_index do |review, index|
       row do
         column("#{review.date}")
         column("#{review.meal.name}")
         column("#{review.rating}")
         column("#{review.content}")
       end
     end
    end
  end

  def display_user_info(user)
    table(border: true) do
     row header: true do
       column("#{user.name}", width: 30)
     end
     row do
       column("Number of MealPal Reviews: #{user.reviews.size}")

     end
     row do
       column("Average MealPal Rating: #{user.average_mealpal_rating}")
     end
    end
  end


end
