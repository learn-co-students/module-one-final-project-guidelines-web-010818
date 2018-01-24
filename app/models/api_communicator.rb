class ApiCommunicator
  ROUTE = "https://app.ticketmaster.com/discovery/v2/"
  API_KEY = "&apikey=S5uxjG6W6tVeFpoilslVCFV1QIXTxkxr"

  def self.get_and_parse(url)
    response = HTTParty.get(url)
    json = JSON.parse("#{response}")
    json["_embedded"]
  end

  def self.get_type_by_state(type, state)
    url = "#{ROUTE}#{type}.json?stateCode=#{state}#{API_KEY}"
    self.get_and_parse(url)
  end

  def self.get_type_by_city(type, state, city)
    results_for_state = get_type_by_state(type,state)

    results_for_state["venues"].select do |venue_hash|
      venue_hash["city"]["name"] == city
    end
  end

  def self.get_segments
    url = "#{ROUTE}classifications.json?#{API_KEY}"
    response = HTTParty.get(url)
    json = JSON.parse("#{response}")
    json["_embedded"]["classifications"].select do |segment_hash|
      segment_hash["segment"]
    end
  def self.get_attractions_by_keyword(keyword)
    keyword.gsub! ' ', '+'
    url = "#{ROUTE}attractions.json?keyword=#{keyword}&sort=relevance,desc#{API_KEY}"
    response = self.get_and_parse(url)
    response["attractions"]
  end

  def self.get_events_by_attraction_id(attraction_id)
    url = "#{ROUTE}events.json?attractionId=#{attraction_id}#{API_KEY}"
    #add check to see if there are any results
    response = get_and_parse(url)
    response["events"]
  end

end
