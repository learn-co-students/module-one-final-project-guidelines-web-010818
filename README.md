# MealPal Meal Rating with Yelp

Our project idea sprang from the fact that there is no good way to rate and share experiences with MealPal restaurants. We thought it would be cool if a user could use the Yelp Fusion API to get information about restaurants they may want to try and then, if that restaurant is on MealPal, to create their own review about their experience. MealPal and regular dining experiences can be vastly different at the same restaurant, so comparing these reviews could be useful.

## Install Instructions

1. Clone repository from GitHub
2. Open terminal
3. Navigate to the repository directory
4. Enter ruby bin/run.rb to execute an instance of the application
  * Prepend bundle exec to your run command if the program fails to run

## Functionality

This is a command line application (CLI) provides the following functionality:
* Users can create a username to persist their data
* Reviews can be creating MealPal meals by finding the restaurant through the Yelp API and associating the meal with the restaurant
* The functionality of the Yelp search can be used to find restaurants by category, name, and location
* Once a restaurant is found, users can view reviews
* Users can view statistics about their own activity, as well as the activity of other users
* Searches can be performed against MealPal reviews

## Execution

The CLI is built around a SQLite database that is interacted with using the Sinatra ActiveRecord gem. The database contains 4 tables:
* restaurants - information is only stored once a user creates a review
  * name
  * address
  * phone_number
  * yelp_rating
  * latitude
  * longitude
  * yelp_review_count
  * yelp_id
  * category
  * mealpal_rating
* meals - associated to restaurants and reviews
  * name
  * restaurant_id
* reviews - associated to meals and users
  * user_id
  * meal_id
  * rating
  * content
* users - information is stored when username is created
  * username
  * location
  * number_of_reviews
  * average_mealpal_rating

The program itself is run through a Cli class that contains all of the code that interacts with the user. Any manipulation or searching of specific tables are handled by classes related to the tables above through ActiveRecord.
