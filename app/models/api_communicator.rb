class ApiCommunicator
  ROUTE = "https://app.ticketmaster.com/discovery/v2/"
  API_KEY = "&apikey=oRYEBxPGTbnqXlNBa48Moa1wMhR2FlJl"

  def self.get_and_parse(url)

    response = HTTParty.get(url)
    json = JSON.parse("#{response}")

    json["_embedded"]
  end

  def self.iterate_through_pages(url,type)
    response = HTTParty.get(url)
    json = JSON.parse("#{response}")
    total_pages = json["page"]["totalPages"]
    current_page = 0
    results_array = []
    while current_page < total_pages && current_page < 50
      page_url = "#{url}&page=#{current_page}"
      page_results = self.get_and_parse(page_url)
      results_array << page_results[type]
      current_page += 1
    end
    results_array.flatten!
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
    self.get_and_parse(url)["classifications"].select do |segment_hash|
      segment_hash["segment"]
    end
  end

  def self.get_attractions_by_keyword(keyword)
    keyword.gsub! ' ', '+'
    url = "#{ROUTE}attractions.json?keyword=#{keyword}&sort=relevance,desc#{API_KEY}"
    self.iterate_through_pages(url, "attractions")
  end

  def self.get_events_by_attraction_id(attraction_id)
    url = "#{ROUTE}events.json?attractionId=#{attraction_id}#{API_KEY}"

    #add check to see if there are any results
    self.iterate_through_pages(url, "events")
  end


  def self.get_attractions_by_genre_id(genre_id)
    url = "#{ROUTE}attractions.json?classificationId=#{genre_id}#{API_KEY}"
    results_array = self.iterate_through_pages(url,"attractions")
    results_array.select do |a|
      a['upcomingEvents']['_total'] > 0
    end
  end

  def self.get_events_by_venue_id(venue_id)
    url = "#{ROUTE}events.json?venueId=#{venue_id}#{API_KEY}"
    #add check to see if there are any results
    self.iterate_through_pages(url, "events")
  end

  def self.get_venue_by_id(venue_id)
    url = "#{ROUTE}venues.json?id=#{venue_id}#{API_KEY}"
    self.iterate_through_pages(url, "venues")
  end

end
