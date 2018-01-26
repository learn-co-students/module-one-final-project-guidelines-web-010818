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
    puts "Search upcoming events by: "
    options = ["Venue","Atrraction","Exit"]
    i = 1
    options.each do |option|
      puts "#{i}. #{option}"
      i += 1
    end

    input = get_input_from_user("",["1","2","3"])
    case input
    when "1"
      search_for_venue
    when "2"
      keyword_or_category
    when "3"
      exit
    end
  end

  def keyword_or_category
    puts "Search by: "
    expected_results = ["1","2","3"]
    options = ["keyword", "category","exit"]
    i = 1
    options.each do |option|
      puts "#{i}. #{option}"
      i += 1
    end
    search_input = get_input_from_user("",expected_results)
    case search_input
    when "1"
      search_for_events_by_attraction
    when "2"
      search_for_attraction_by_genre
    when "3"
      exit
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
    find_genres_for_segment
  end




end
