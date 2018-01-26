
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



def get_state_city_venues
  state = get_input_from_user("Enter a state code.", STATE_CODES, "upcase")
  city = get_input_from_user("Enter a city.")
  ApiCommunicator.get_type_by_city("venues", state, city)
end


def find_venues_by_city
  hash = get_state_city_venues
  if hash != []
    hash.each { |v| find_or_create_venue(v) }
    hash
  else
    puts "Nothing found!"
    find_venues_by_city
  end
end

def choose_venue_from_results(venues_array)
  puts "Found venues:"
  chosen_index = choose_by_number(venues_array,"name")
  chosen_venue = venues_array[chosen_index]
end

def search_events_by_venue(venue_id)
  event_results = ApiCommunicator.get_events_by_venue_id(venue_id)
  created_events = []
  event_results.each do |event_hash|
    created_events << find_or_create_event(event_hash)
  end
  puts_events(created_events)
end

def limit_to_twenty(event_rows)
  if event_rows.size > 20
    event_rows = event_rows.slice(0..19)
    puts "Too many events! Returning first 20."
    event_rows
  end
  event_rows
end

def puts_events(event_rows)
  event_rows = limit_to_twenty(event_rows)

  event_rows.each do |event_row|

    name = event_row['name']
    venue = Venue.find_by(id:event_row['venue_id'])
    if !venue
      venue_name = "Unknown"
    else
      venue_name = venue.name
    end
    if event_row['dateTime']
      date = event_row['dateTime']
    else
      date = "Unknown"
    end

    puts "#{name} - #{venue_name} - #{date}"

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

def get_genre_id_from_segment(segment)
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

  genre_id
end

def filter_attractions_by_location(genre_id)

  state = get_input_from_user("Enter a state code.")
  city = get_input_from_user("Enter a city.")
  venue_hash = ApiCommunicator.get_type_by_city("venues", state, city)
  venue_id_array = []
  venue_hash.each do |v|
    find_or_create_venue(v)
    venue_id_array << v['id']
  end

  events_array = []
  venue_id_array.each do |venue_id|
    events_array << ApiCommunicator.get_events_by_venue_id_and_genre_id(venue_id, genre_id)
  end
  events_array.flatten!

  events_array.delete_if { |e| e == nil }
  if events_array != [] && events_array
    event_instances = []
    events_array.each do |event|
      new_event = find_or_create_event(event)
      event_instances << new_event
    end

  puts_events(event_instances)
  else
    puts "Not found!"
    find_genres_for_segment
  end
end

def find_genres_for_segment
  puts "These are the available segments:"
  #segments to more "normal" term?
  put_segment_options
  segment = get_input_from_user("Enter a segment.")
  genre_id = get_genre_id_from_segment(segment)
  filter_attractions_by_location(genre_id)
end



def choose_by_number(results,parameter) # takes hash of results and data type (attraction, event, etc)
  i = 1
  print_array = results.map { |e| e[parameter] }
  print_array.uniq.each do |e|
    puts "#{i}. #{e}"
    i += 1
  end
  range = (1..i).to_a
  response = get_input_from_user("Please select one of the above by number.",range,"integer")

  response.to_i - 1

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
    selected_attraction["id"]
  end
end

def collect_ids_from_array(array_of_hashes)
  array_of_hashes.map do |e|
    e.id
  end
end

def create_and_save_events_from_array(array)
  newly_added = []
  events.each do |e|
    new_event = find_or_create_event(e)
    newly_added << new_event.id
  end
  newly_added
end

def find_events_for_attraction(attraction_id)
  events = ApiCommunicator.get_events_by_attraction_id(attraction_id)
  if !events
    puts "No events found!"
    get_attraction_id_by_keyword
  else
    newly_added = create_and_save_events_from_array(events)
    state_code = filter_events_by_location(newly_added)
    venues_in_state = Venue.select { |venue| venue.state_code == state_code}
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
