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



  def find_events_for_attraction

  end

  def find_events_by_segment_and_city

  end

  def find_events_by_genre_and_location

  end

  def find_events_for_date_and_city

  end
end
