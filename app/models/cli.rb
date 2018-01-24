class Cli
  attr_accessor :current_user



  def welcome
    current_session = Cli.new
  end

  def venue_or_attraction
    # search for venue or event?
    # search for event by venue, attraction, or both?
  end

  def search_for_venue
    # Search for venue by location
    # get state and city, return list of venues
    # pick one and see upcoming events
  end

  def search_for_attraction
    # Search by segment & genre OR keyword
    # return attractions
    # pick one and see upcoming events
  end

  def search_for_events
    # search by venue or attraction
    # option to refine results by date
    # option to refine by location
    # return event list
    # pick one and get details
  end





  #### Helper methods

  ### Create class instances

  def find_or_create_event(event_result_hash)
    new_event = Event.find_or_create_by(id:event_result_hash["id"]) do |event|
      event.name = event_result_hash['name']
      event.venue_id = event_result_hash['_embedded']['venues'][0]['id']
      event.attraction_id = event_result_hash['_embedded']['attractions'][0]['id']
      event.dateTime = event_result_hash['dates']['start']['dateTime']
    end
    new_event
  end

  def find_or_create_attraction(attraction_result_hash)
    new_attraction = Attraction.find_or_create_by(id:attraction_result_hash["id"]) do |attraction|
      attraction.name = attraction_result_hash['name']
      classifications_info = attraction_result_hash['classifications'][0]
      attraction.segment_id = classifications_info['segment']['id']
      attraction.genre_id = classifications_info['genre']['id']
    end
    new_attraction
  end

  def find_or_create_venue(venue_result_hash)
    new_venue = Venue.find_or_create_by(id:venue_result_hash['id']) do |venue|
      venue.name = venue_result_hash['name']
      venue.city = venue_result_hash['city']['name']
      venue.state_code = venue_result_hash['state']['stateCode']
    end
    new_venue
  end


  def get_input_from_user(string)
    puts string
    gets.chomp.downcase.split(/ |\_|\-/).map(&:capitalize).join(" ")
  end

  def find_venues_by_city
    state = self.get_input_from_user("Enter a state code.")
    city = self.get_input_from_user("Enter a city.")
    hash = ApiCommunicator.get_type_by_city("venues", state, city)
    hash.each do |v|
      find_or_create_venue(v)
    end
    chosen_venue = choose_by_number(hash,"name")
  end

  def puts_events(event_rows)
    event_rows.each do |event_row|
      name = event_row.name
      venue = Venue.find_by(id:event_row.venue_id)
      date = event_row.dateTime
      puts "#{name} - #{venue.name} - #{date}"
    end
  end

  # def get_events_from_venue
  #   venue = find_venues_by_city
  #   venue_id = venue['id']
  #   ApiCommunicator.get_events_by_venue_id(venue_id)
  #
  #   found_events.each do |event|
  #     find_or_create_event(event)
  #   end
  #
  #   events_from_db = Event.select do |event|
  #     event.venue_id == venue_id
  #   end
  #
  #   puts_events(events_from_db)
  # end

  # def put_segment_options
  #   hash = ApiCommunicator.get_segments
  #   hash.each do |s|
  #     Segment.find_or_create_by(id: s['segment']['id']) do |segment|
  #       segment.name = s['segment']['name']
  #     end
  #     puts "-#{s['segment']['name']}"
  #   end
  # end

  # def put_genres_in_segment(segment)
  #   hash = ApiCommunicator.get_segments.select do |s|
  #     s['segment']['name'] == segment
  #   end.first
  #   i = 1
  #   hash['segment']["_embedded"]["genres"].each do |g|
  #     Genre.find_or_create_by(id: g['id']) do |genre|
  #       genre.name = g['name']
  #     end
  #     puts "#{i}. #{g['name']}"
  #     i += 1
  #   end
  #
  #   response = self.get_input_from_user("Please select one of the above by number.")
  #
  #   index = response.to_i - 1
  #   selected_genre = hash['segment']["_embedded"]["genres"][index]
  #   genre_id = selected_genre["id"]
  #   attractions = ApiCommunicator.get_attractions_by_genre_id(genre_id)
  #
  #   attractions.each do |a|
  #     new_attraction = self.find_or_create_attraction(a)
  #     puts new_attraction.name
  #   end
  # end

  # def find_genres_for_segment
  #   puts "These are the available segments:"
  #   #segments to more "normal" term?
  #   self.put_segment_options
  #   segment = self.get_input_from_user("Enter a segment.")
  #   self.put_genres_in_segment(segment)
  # end



  def choose_by_number(results,parameter) # takes hash of results and data type (attraction, event, etc)
    i = 1

    print_array = results.map do |e| #iterates through results, prints with number
      e[parameter]
    end

    print_array.uniq.each do |e|
      puts "#{i}. #{e}"
      i += 1
    end
    # gets number from user
    response = self.get_input_from_user("Please select one of the above by number.")
    index = response.to_i - 1 # get item index from selected number
    selected = results[index] #return hash for selected data
  end

  def get_attraction_id_by_keyword
    #get attractions by keyword
    keyword = self.get_input_from_user("Enter a keyword to search for.")
    parsed_results = ApiCommunicator.get_attractions_by_keyword(keyword)
    selected_attraction = choose_by_number(parsed_results,"name")
    find_or_create_attraction(selected_attraction) #adds selected attraction to db
    attraction_id = selected_attraction["id"]
  end

  def collect_ids_from_array(array_of_hashes)
    array_of_hashes.map do |e|
      e.id
    end
  end

  def find_events_for_attraction
    attraction_id = get_attraction_id_by_keyword
    events = ApiCommunicator.get_events_by_attraction_id(attraction_id)
    newly_added = []
    events.each do |e|
      new_event = find_or_create_event(e)
      newly_added << new_event.id
    end
    state_code = filter_events_by_location(newly_added)
    venues_in_state = Venue.select do |venue|
      venue.state_code == state_code
    end
    venue_ids = collect_ids_from_array(venues_in_state)
    found_events = Event.select do |event|
      event.attraction_id == attraction_id && venue_ids.include?(event.venue_id)
    end
    puts_events(found_events)
  end



  def filter_events_by_location(event_id_array) #through venue
    location_tracker = []
    event_id_array.each do |event_id|
      event = Event.find_by(id:event_id)
      event_venue = ApiCommunicator.get_venue_by_id(event.venue_id)
      if event_venue && event_venue[0]["country"]['countryCode'] == "US"
        new_venue = find_or_create_venue(event_venue[0])
        location_tracker << new_venue
      end
    end

    chosen_state = choose_by_number(location_tracker,"state_code")

    chosen_state["state_code"] #return state code
  end

  # def filter_event_results(event_results)
  #   if event_results.size > 20
  #     # filter by date
  #     # filter by location
  #   end
  # end


  def find_attractions_for_genre
    # gets segment then genre from user, returns like of attractions
    find_genres_for_segment
    response = get_input_from_user("")
    #built genre retrieval in #puts genres by segment

  end
  #Matt





end
