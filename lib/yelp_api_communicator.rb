# YELP FUSION API TUTORIAL CODE SOURCE:
# https://github.com/Yelp/yelp-fusion/tree/master/fusion/ruby

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

# puts "Search a Restaurant: "
# term = gets.chomp
# puts "Specify a location: "
# location = gets.chomp

# result = search(term,location)
# if result["error"]
#   puts result["error"]["description"]
# else
#   restaurants = result["businesses"].each do |restaurant|
#     puts "Name: " + restaurant["name"]
#     puts "Address: " + restaurant["location"]["display_address"].join(", ")
#     puts "Number of Reviews: #{restaurant["review_count"]}"
#     puts "Average Rating: #{restaurant["rating"]}"
#     puts "\n"
#   end
# end
