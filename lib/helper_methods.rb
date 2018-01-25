
#### Helper methods

### Create class instances

STATE_CODES = [ "AK","AL","AR","AS","AZ", "CA","CO","CT","DC", "DE",
                "FL","GA","GU","HI","IA","ID","IL","IN","KS","KY",
                "LA","MA","MD","ME","MI","MN","MO","MS","MT","NC",
                "ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR",
                "PA","PR","RI","SC","SD","TN","TX","UT","VA","VI",
                "VT","WA","WI","WV","WY"]

def find_or_create_event(event_result_hash)
  new_event = Event.find_or_create_by(id:event_result_hash["id"]) do |event|
    event.name = event_result_hash['name']
    event.venue_id = event_result_hash['_embedded']['venues'][0]['id']
    event.attraction_id = event_result_hash['_embedded']['attractions'][0]['id']
    if event_result_hash['dates']['start']['dateTime']
      event.dateTime = event_result_hash['dates']['start']['dateTime']
    end
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


def get_input_from_user(string, expected_result_array=nil,format_input=nil)
  puts string
  user_input = gets.chomp.downcase.split(/ |\_|\-/).map(&:capitalize).join(" ")
  if format_input == "upcase"
    user_input.upcase!
  elsif format_input == "integer"
    user_input = user_input.to_i
  end
  if expected_result_array == nil || expected_result_array.include?(user_input)
    user_input
  else
    get_input_from_user("Input not recognized! Please try again: ",expected_result_array,format_input)
  end
end

def find_venues_by_city
  state = get_input_from_user("Enter a state code.", STATE_CODES, "upcase")
  city = get_input_from_user("Enter a city.")
  hash = ApiCommunicator.get_type_by_city("venues", state, city)

  if hash != []
    hash.each do |v|
      find_or_create_venue(v)
    end
    chosen_index = choose_by_number(hash,"name")
    chosen_venue = hash[chosen_index]
  else
    puts "Nothing found!"
    find_venues_by_city
  end
end

def puts_events(event_rows)
  event_rows.each do |event_row|
    name = event_row.name
    venue = Venue.find_by(id:event_row.venue_id)
    date = event_row.dateTime
    puts "#{name} - #{venue.name} - #{date}"
  end
end


def put_segment_options
  hash = ApiCommunicator.get_segments
  hash.each do |s|
    Segment.find_or_create_by(id: s['segment']['id']) do |segment|
      segment.name = s['segment']['name']
    end
    puts "-#{s['segment']['name']}"
  end
end

def get_attractions_from_segment(segment)
  hash = ApiCommunicator.get_segments.select do |s|
    s['segment']['name'] == segment
  end.first
  i = 1
  hash['segment']["_embedded"]["genres"].each do |g|
    Genre.find_or_create_by(id: g['id']) do |genre|
      genre.name = g['name']
    end
    puts "#{i}. #{g['name']}"
    i += 1
  end

  response = get_input_from_user("Please select one of the above by number.")

  index = response.to_i - 1
  selected_genre = hash['segment']["_embedded"]["genres"][index]
  genre_id = selected_genre["id"]
  attractions = ApiCommunicator.get_attractions_by_genre_id(genre_id)

  attractions.each do |a|
    find_or_create_attraction(a)
  end

  attractions
end

def filter_attractions_by_location(attractions_array)

  state = get_input_from_user("Enter a state code.")
  city = get_input_from_user("Enter a city.")
  venue_hash = ApiCommunicator.get_type_by_city("venues", state, city)
  venue_hash.each do |v|
    new_venue = Venue.find_or_create_by(id:v['id']) do |venue|
      venue.name = v['name']
      venue.city = v['city']['name']
      venue.state_code = v['state']['stateCode']
    end
  end

  #pull events api
  #select those with attraction_id = to attraction
  #save them

  #filter through them to find ones with venue = any of venue hash above
  #put only attractions with ids included in events filtered in previous
  newly_added_events = []
  new_attractions_array = attractions_array.select { |a| a['upcomingEvents']['_total'] > 0 }
  new_attractions_array = new_attractions_array.slice(0..20)
  new_attractions_array.each do |a|
  events = ApiCommunicator.get_events_by_attraction_id(a['id'])


    if events != nil
      events.each do |e|
        new_event = find_or_create_event(e)
        newly_added_events << new_event
      end
    end
  end

  events_at_location = []
  venue_hash.each do |v|
    if Event.find_by(venue_id: v['id'])
      events_at_location << Event.find_by(venue_id: v['id'])
    end
  end

  result = new_attractions_array.select do |a|
    events_at_location.map { |e| e['attraction_id'] }.include?(a['id'])
  end

  result.each { |r| puts "#{r['name']}" }
end

def find_genres_for_segment
  puts "These are the available segments:"
  #segments to more "normal" term?
  put_segment_options
  segment = get_input_from_user("Enter a segment.")
  attractions_array = get_attractions_from_segment(segment)
  filter_attractions_by_location(attractions_array)
end



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
  range = (1..i).to_a
  response = get_input_from_user("Please select one of the above by number.",range,"integer")
  index = response.to_i - 1 # get item index from selected number
   #return hash for selected data
end



def get_attraction_id_by_keyword
  #get attractions by keyword
  keyword = get_input_from_user("Enter a keyword to search for.")
  parsed_results = ApiCommunicator.get_attractions_by_keyword(keyword)
  if !parsed_results
    puts "Not found!"
    get_attraction_id_by_keyword
  else
    puts "Here's what I found for that keyword: "
    selected_index = choose_by_number(parsed_results,"name")
    selected_attraction = parsed_results[selected_index]
    find_or_create_attraction(selected_attraction) #adds selected attraction to db
    attraction_id = selected_attraction["id"]
  end
end

def collect_ids_from_array(array_of_hashes)
  array_of_hashes.map do |e|
    e.id
  end
end

def find_events_for_attraction(attraction_id)
  events = ApiCommunicator.get_events_by_attraction_id(attraction_id)
  if !events
    puts "No events found!"
    get_attraction_id_by_keyword
  else
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
      newly_added.include?(event.id) && venue_ids.include?(event.venue_id)
    end
    puts "Events in #{state_code}: "
    puts_events(found_events)
  end
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
  puts "Here are the states with events for that attraction: "
  chosen_index = choose_by_number(location_tracker,"state_code")
  location_codes = location_tracker.map do |venue|
    venue["state_code"]
  end

  chosen_state = location_codes.uniq[chosen_index]
  chosen_state #return state code
end



def find_attractions_for_genre
  # gets segment then genre from user, returns like of attractions
  find_genres_for_segment
  response = get_input_from_user("")
  #built genre retrieval in #puts genres by segment

end
#Matt
