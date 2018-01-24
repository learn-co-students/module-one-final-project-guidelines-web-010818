class Cli
  attr_accessor :current_user



  def welcome
    current_session = Cli.new
  end

  def venue_or_attraction
    # search for venue or event?
    #search for event by venue, attraction, or both?
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


  def get_input_from_user(string)
    puts string
    gets.chomp.downcase.split(/ |\_|\-/).map(&:capitalize).join(" ")
  end

  def find_venues_by_city
    state = self.get_input_from_user("Enter a state code.")
    city = self.get_input_from_user("Enter a city.")
    hash = ApiCommunicator.get_type_by_city("venues", state, city)
    hash.each do |v|
      new_venue = Venue.find_or_create_by(id:v['id']) do |venue|
        venue.name = v['name']
        venue.city = v['city']['name']
        venue.state_code = v['state']['stateCode']
      end
      puts "-#{v['name']}"
    end
  end

  def get_events_from_venue
    # one user chooses venue, get list of upcoming events
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

  def put_genres_in_segment(segment)
    hash = ApiCommunicator.get_segments.select do |s|
      s['segment']['name'] == segment
    end.first
    hash['segment']["_embedded"]["genres"].each do |g|
      Genre.find_or_create_by(id: g['id']) do |genre|
        genre.name = g['name']
      end
      puts "-#{g['name']}"
    end
  end

  def find_genres_for_segment
    self.put_segment_options
    segment = self.get_input_from_user("Enter a segment.")
    self.put_genres_in_segment(segment)
  end

  def find_or_create_event(event_result_hash)
  new_event = Event.find_or_create_by(id:event_result_hash["id"]) do |event|
    event.name = event_result_hash['name']
    event.venue_id = event_result_hash['_embedded']['venues'][0]['id']
    event.attraction_id = event_result_hash['_embedded']['attractions'][0]['id']
    event.dateTime = event_result_hash['dates']['start']['dateTime']
  end
  new_event
  end



  def find_events_for_attraction
    #get attractions by keyword
    keyword = self.get_input_from_user("Enter a keyword to search for.")
    parsed_results = ApiCommunicator.get_attractions_by_keyword(keyword)

    i = 1

    parsed_results.each do |attraction|
      puts "#{i}. #{attraction["name"]}"
      i += 1
    end

    response = self.get_input_from_user("Please select one of the above by number.")

    index = response.to_i - 1
    selected_attraction = parsed_results[index]
    attraction_id = selected_attraction["id"]
    events = ApiCommunicator.get_events_by_attraction_id(attraction_id)

    events.each do |e|
      new_event = self.find_or_create_event(e)
      puts new_event.name
    end
  end


  def find_attractions_for_genre
    # gets segment then genre from user, returns like of attractions
  end
  #Matt


  def find_events_for_venue
    # return upcoming events at venue, option to filter by date

  end
  #Katy

  def filter_by_date
    #filter results by date
  end
  

end
