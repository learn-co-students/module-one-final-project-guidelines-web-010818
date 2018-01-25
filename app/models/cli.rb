class Cli
  attr_accessor :current_user

  def welcome
    puts "Hello!"
    venue_or_event
  end

  def search_again?
    input = get_input_from_user("Would you like to search again?",["Yes","No"])
    case input
    when "Yes"
      venue_or_event
    when "No"
      exit
    end
  end

  def venue_or_event
    prompt = "Are you looking for a venue or an event?"
    expected_results = ["Venue","Event", "Exit"]
    input = get_input_from_user(prompt,expected_results)
    case input
    when "Venue"
      search_for_venue
    when "Event"
      keyword_or_category
    when "Exit"
      exit
    end
  end

  def keyword_or_category
    prompt = "Would you like to search by keyword or browse by category?"
    expected_results = ["Keyword","Category"]
    search_input = get_input_from_user(prompt,expected_results)
    if search_input == "Keyword"
      search_for_events_by_attraction
    elsif search_input == "Category"
      search_for_attraction_by_genre
    end
  end

  def search_for_venue
    # Search for venue by location
    # get state and city, return list of venues
    venues_in_city = find_venues_by_city
    chosen_venue = choose_venue_from_results(venues_in_city)
    search_events_by_venue(chosen_venue["id"])
    search_again?


  end



  def search_for_events_by_attraction
    # search for attraction by keyword
    attraction_id = get_attraction_id_by_keyword
    find_events_for_attraction(attraction_id)
    search_again?
  end



  def search_for_attraction_by_genre
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


end
