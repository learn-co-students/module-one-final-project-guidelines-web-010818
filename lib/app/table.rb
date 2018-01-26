class Table
  include CommandLineReporter

  def display_main_menu
    table(border: true) do
     row header: true do
       column('MEALPAL RATINGS APP', width: 50)
     end
     row do
       column('1. View Your View Your Past Meals and Reviews')
     end
     row do
       column('2. Enter a New Review')
     end
     row do
       column('3. Search Yelp')
     end
     row do
       column('4. View App Stats')
     end
     row do
       column('5. Logout')
     end
     row do
       column('6. Exit')
     end
   end
  end

  def display_stats_menu
    table(border: true) do
     row header: true do
       column('MEALPAL RATINGS APP STATS', width: 50)
     end
     row do
       column('1. Top 10 Restaurants by Yelp Rating')
     end
     row do
       column('2. Top 10 Restaurants by Mealpal Rating')
     end
     row do
       column('3. Most Active Users')
     end
     row do
       column('4. Most Critical Users')
     end
     row do
       column('5. Kindest Users')
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

  def display_yelp_reviews(restaurant)
    header title: "Yelp Reviews"
    table(border: true) do
     row header: true do
       column('DATE', width: 10)
       column('USER', width: 10)
       column('RATING', width: 6)
       column('CONTENT', width: 35)
     end
     restaurant.get_yelp_reviews.each_with_index do |review, index|
       row do
         column("#{review["time_created"]}")
         column("#{review["name"]}")
         column("#{review["rating"]}")
         column("#{review["text"]}")
       end
     end
    end
  end

  def display_mealpal_reviews(restaurant)
    header title: "MealPal Reviews"
    table(border: true) do
     row header: true do
       column('DATE', width: 10)
       column('USER', width: 10)
       column('RATING', width: 6, align: 'center')
       column('CONTENT', width: 35)
     end
     restaurant.reviews.each_with_index do |review, index|
       row do
         column("#{review.date}")
         column("#{review.user.name}")
         column("#{review.rating}")
         column("#{review.content}")
       end
     end
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

  def display_top_10_yelp
    table(border: true) do
      row header: true do
        column("Top 10 Yelp Restaurants by Ratings", width: 34)
      end
      array = Restaurant.top_10_yelp
      array.each_with_index do |restaurant, index|
        row do
          column("#{index + 1}. #{restaurant.name} - #{restaurant.yelp_rating}")
        end
      end
    end
  end

  def display_top_10_mealpal
    table(border: true) do
      row header: true do
        column("Top 10 Mealpal Restaurants by Ratings", width: 37)
      end
      array = Restaurant.top_10_mealpal
      array.each_with_index do |restaurant, index|
        row do
          column("#{index + 1}. #{restaurant.name} - #{restaurant.mealpal_rating}")
        end
      end
    end
  end

  def display_user_stats(user_stats_method, table_title)
    header title: table_title, align: 'center', width: table_title.size
    table(border: true) do
      row do
        column("Name", width: 12, align: "left")
        column("Reviews", width: 7, align: "center")
        column("Average Rating", width: 7, align: "center")
      end
      array = user_stats_method
      array.each_with_index do |user, index|
        row do
          column("#{index + 1}. #{user.name}")
          column("#{user.number_of_reviews}")
          column("#{user.average_mealpal_rating}")
        end
      end
    end
  end

end
