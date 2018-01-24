class Cli
  attr_accessor :current_user

  def initialize
    @current_user = current_user
  end

  def welcome

  end

  def get_state_from_user
    puts "Enter a state code."
    gets.chomp
  end

  def get_city_from_user
    puts "Enter a city."
    gets.chomp
  end

  def self.find_venues_by_city
    state = get_state_from_user
    city = get_city_from_user
    hash = ApiCommunicator.get_type_by_city("venues", state, city)
    hash.each do |v|
      new_venue = Venue.find_or_create_by(id:v['id']) do |venue|
        venue.name =  v['name']
        venue.city =  v['city']['name']
        venue.state_code = v['state']['stateCode']
      end
      puts "-#{v['name']}"
    end
  end





  def self.find_events_for_attraction
    #get attractions by keyword
    puts "Enter a keyword to search for."
    keyword = gets.chomp
    parsed_results = ApiCommunicator.get_attractions_by_keyword(keyword)
    i = 1
    parsed_results.each do |attraction|
      puts "#{i}. #{attraction["name"]}"
      i += 1
    end
    puts "Please select one of the above by number."
    response = gets.chomp.to_i
    index = response - 1
    selected_attraction = parsed_results[index]
    attraction_id = selected_attraction["id"]
    events = ApiCommunicator.get_events_by_attraction_id(attraction_id)
    binding.pry
    
    # search events with attractionId

  end

  def find_events_by_segment_and_city

  end

  def find_events_by_genre_and_location

  end

  def find_events_for_date_and_city

  end
end
