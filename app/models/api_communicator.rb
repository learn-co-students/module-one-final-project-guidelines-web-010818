class ApiCommunicator
  ROUTE = "https://app.ticketmaster.com/discovery/v2/"
  API_KEY = "&apikey=S5uxjG6W6tVeFpoilslVCFV1QIXTxkxr"

  def self.get_type_by_state(type, state)
    url = "#{ROUTE}#{type}.json?stateCode=#{state}#{API_KEY}"
    response = HTTParty.get(url)
    json = JSON.parse("#{response}")
  end

  def self.get_type_by_city(type, state, city)
    results_for_state = get_type_by_state(type,state)

    results_for_state["_embedded"]["venues"].select do |venue_hash|
      venue_hash["city"]["name"] == city
    end
  end

end
