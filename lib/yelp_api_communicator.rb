# YELP FUSION API TUTORIAL CODE SOURCE:
# https://github.com/Yelp/yelp-fusion/tree/master/fusion/ruby
#
# Make a request to the Fusion search endpoint. Full documentation is online at:
# https://www.yelp.com/developers/documentation/v3/business_search
#
# term - search term used to find businesses
# location - what geographic location the search should happen
#
# Examples
#
#   search("burrito", "san francisco")
#   # => {
#          "total": 1000000,
#          "businesses": [
#            "name": "El Farolito"
#            ...
#          ]
#        }
#
#   search("sea food", "Seattle")
#   # => {
#          "total": 1432,
#          "businesses": [
#            "name": "Taylor Shellfish Farms"
#            ...
#          ]
#        }
#
# Returns a parsed json object of the request
# API_KEY = '4EBJY8ivWTcB1SRXIXZ1hQXqE14y4HqOYwpGTo1zgly-_oTa9wNahyobVvj3hM2Rv-3_vmMWon_QTun3WMSVZ4BQKkvz804kjC3eh51pKiIpWqEZQuhIn-TENVVmWnYx'
#
#
# # Constants, do not change these
# API_HOST = "https://api.yelp.com"
# SEARCH_PATH = "/v3/businesses/search"
# BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
#
#
# DEFAULT_BUSINESS_ID = "yelp-san-francisco"
# DEFAULT_TERM = "dinner"
# DEFAULT_LOCATION = "New York, NY"
# SEARCH_LIMIT = 5

def search(term, location="new york")
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

puts "Search a Restaurant: "
term = gets.chomp
puts "Specify a location: "
location = gets.chomp

result = search(term,location)
if result["error"]
  puts result["error"]["description"]
else
  restaurants = result["businesses"].each do |restaurant|
    puts "Name: " + restaurant["name"]
    puts "Address: " + restaurant["location"]["display_address"].join(", ")
    puts "Number of Reviews: #{restaurant["review_count"]}"
    puts "Average Rating: #{restaurant["rating"]}"
    puts "\n"
  end
end


business_id = "yelp-san-francisco"
def business(business_id)
  url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"

  response = HTTP.auth("Bearer #{API_KEY}").get(url)
  response.parse
end

def business_reviews(business_id)
  url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"

  response = HTTP.auth("Bearer #{API_KEY}").get(url)
  response.parse
end

reviews = business_reviews(business_id)["reviews"]
reviews.each do |review|
  puts review["text"]
  puts review["user"]["name"]
  puts "\n"
end

binding.pry

puts reviews
