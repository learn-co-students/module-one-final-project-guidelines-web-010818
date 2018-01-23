class YelpApiAdapter
  #Returns a parsed json object of the request
  API_KEY = '4EBJY8ivWTcB1SRXIXZ1hQXqE14y4HqOYwpGTo1zgly-_oTa9wNahyobVvj3hM2Rv-3_vmMWon_QTun3WMSVZ4BQKkvz804kjC3eh51pKiIpWqEZQuhIn-TENVVmWnYx'


  # Constants, do not change these
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


  DEFAULT_BUSINESS_ID = "yelp-san-francisco"
  DEFAULT_TERM = "dinner"
  DEFAULT_LOCATION = "New York, NY"
  SEARCH_LIMIT = 5

  def self.search(term, location="new york")
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
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
end
