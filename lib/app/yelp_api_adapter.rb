class YelpApiAdapter
  # #Returns a parsed json object of the request
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
  # SEARCH_LIMIT = 1

  def self.search(term, location="new york")
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse["businesses"]
  end

  # business_id = "yelp-san-francisco"
  # def self.business(business_id)
  #   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
  #
  #   response = HTTP.auth("Bearer #{API_KEY}").get(url)
  #   response.parse
  # end
  #
  def self.business_reviews(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"

    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
  end

  def self.parse_search(restaurant_hash)
    parsed_hash = {}
    restaurant_hash.each do |k,v|
      # binding.pry
      case k
      when "id"
        parsed_hash["yelp_id"] = v
      when "rating"
        parsed_hash["yelp_rating"] = v
      when "location"
        v.each do |location_info, location_value|
          if location_info == "display_address"
            parsed_hash["address"] = location_value.join(", ")
          end
        end
      when "coordinates"
        v.each do |coordinate, coordinate_value|
          parsed_hash[coordinate] = coordinate_value
        end
      when "review_count"
        parsed_hash["yelp_review_count"] = v
      when "display_phone"
        parsed_hash["phone_number"] = v
      when "name"
        parsed_hash[k] = v
      end
    end
    parsed_hash
  end

  def self.search_and_parse(term, location="new york")
    restaurant_array = self.search(term, location)
    parsed_array = restaurant_array.map do |restaurant|
      binding.pry
      parse_hash(restaurant)
    end
    parsed_array
    binding.pry
  end

end
