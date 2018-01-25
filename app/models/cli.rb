class Cli
  attr_accessor :current_game

  def welcome
    puts
    puts "Welcome to Where in NYC is Carmen Sandiego!"
    p1 = find_or_create_player(player_name_getter)
    new_game = Game.create()
    self.current_game = new_game
    p1.games << new_game
    new_game.generate_new_game_data
    start_game
  end

  def player_name_getter
    puts
    puts "Please enter your name:"
    player_name = gets.chomp
  end

  def find_or_create_player(name)
    if Player.all.find {|p| p.name == name}
      Player.all.find {|p| p.name == name}
    else
      Player.create(name: name)
    end
  end

  def start_game
    puts
    puts "A horrible crime has occurred!!"
    puts "The suspect was seen leaving the bank and it's your job to track them down!"
    puts "You will have 24 hours to apprehend the criminal."
    puts
    player_menu
  end

  def player_menu
    puts
    puts "Welcome to #{current_game.neighborhood.name}"
    puts
    puts "What would you like to do?"
    puts
    puts "1. Interview Witnesses"
    puts "2. Travel to Next Location"
    puts "3. Record Evidence"
    puts "4. End Game"
    puts
    response = gets.chomp

    case response
    when "1"
      interview
    when "2"
      travel(get_travel_options)
    when "3"
      record_evidence
    when "4"
      exit
    else
      puts "Thats option is not valid"
      player_menu
    end
  end

  def interview
    next_index = current_game.neighborhoods.find_index(current_game.neighborhood) + 1
    next_neighborhood = current_game.neighborhoods[next_index]
    #Need to access witnesses for stores in current neighborhood
    store1 = current_game.neighborhood.stores[0]
    store2 = current_game.neighborhood.stores[1]
    store3 = current_game.neighborhood.stores[2]

    #Need to access clues for *next* correct neighborhood
    next_store1 = next_neighborhood.stores[0]
    next_store2 = next_neighborhood.stores[1]
    next_store3 = next_neighborhood.stores[2]

    puts
    puts "Which place would you like to visit?"
    puts
    puts "1. #{store1.name}"
    puts "2. #{store2.name}"
    puts "3. #{store3.name}"
    puts "4. Go Back"
    puts

    response = gets.chomp

    case response
    when "1"
      puts
      puts "The #{store1.witness} says: \"#{get_clue(next_store1)}\""
      interview
    when "2"
      puts
      puts "The #{store2.witness} says: \"#{get_clue(next_store2)}\""
      interview
    when "3"
      puts
      puts "The #{store3.witness} says: \"#{get_clue(next_store3)}\""
      interview
    when "4"
      player_menu
    else
      puts
      puts "That option is not valid"
      interview
    end
  end

  def get_clue(store)
    gsc = current_game.game_store_clues.select { |gsc| gsc.store == store }
    gsc[0].clue.text
  end

  def travel(options)
    puts
    puts "Where would you like to go?"
    puts
    options.each_with_index do |t, index|
      puts "#{index + 1}. #{t.name}"
    end
    puts "#{options.size + 1}. Go Back"
    puts

    response = gets.chomp

    case response
    when "1"
      puts
      puts "You are now in #{options[0].name}!"
      puts
      current_game.neighborhood = options[0]
    when "2"
      puts
      puts "You are now in #{options[1].name}!"
      puts
      current_game.neighborhood = options[1]
    when "3"
      puts
      puts "You are now in #{options[2].name}!"
      puts
      current_game.neighborhood = options[2]
    when "4"
      puts
      puts "You are now in #{options[3]}.name!"
      puts
      current_game.neighborhood = options[3]
    when "5"
      player_menu
    else
      puts
      puts "That option is not valid"
      travel
    end

    player_menu
  end

  def get_travel_options
    num_choices = 3
    index = current_game.neighborhoods.find_index(current_game.current_neighborhood)
    travel_options = []
    #add next correct neighborhood
    travel_options << current_game.neighborhoods[index + 1]
    binding.pry
    # Get 4 more options from Neighborhood.all that aren't in current_game.neighborhoods
    while num_choices > 0
      add_neighborhood = Neighborhood.all[rand(0..9)]
      if !(current_game.neighborhoods.include?(add_neighborhood) || travel_options.include?(add_neighborhood))
        travel_options << add_neighborhood
        num_choices -= 1
      end
    end

    travel_options.shuffle
  end

  def record_evidence
    puts
    puts "Recording evidence...."
    puts
    player_menu
  end
end
