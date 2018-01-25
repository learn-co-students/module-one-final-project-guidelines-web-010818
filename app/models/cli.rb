require 'io/console'

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
    if !current_game.next_correct_neighborhood.nil?
      next_neighborhood = current_game.next_correct_neighborhood
      #Need to access witnesses for stores in current neighborhood
      store1 = current_game.neighborhood.stores[0]
      store2 = current_game.neighborhood.stores[1]
      store3 = current_game.neighborhood.stores[2]
      #Need to access clues for *next* correct neighborhood
      next_store1 = next_neighborhood.stores[0]
      next_store2 = next_neighborhood.stores[1]
      next_store3 = next_neighborhood.stores[2]

      interview_menu(current_game.neighborhood.stores, next_neighborhood.stores)
    else
      puts
      puts "You reached the end! The suspect is #{current_game.suspect}."
      puts
      exit
    end
  end

  def interview_menu(store, next_store)
    puts
    puts "Which place would you like to visit?"
    puts
    puts "1. #{store[0].name}"
    puts "2. #{store[1].name}"
    puts "3. #{store[2].name}"
    puts "4. Go Back"
    puts

    response = gets.chomp

    case response
    when "1"
      puts
      puts "The #{store[0].witness} says: \"#{get_clue(next_store[0])}\""
      interview_menu(store, next_store)
    when "2"
      puts
      puts "The #{store[1].witness} says: \"#{get_clue(next_store[1])}\""
      interview_menu(store, next_store)
    when "3"
      puts
      puts "The #{store[2].witness} says: \"#{get_clue(next_store[2])}\""
      interview_menu(store, next_store)
    when "4"
      player_menu
    else
      puts
      puts "That option is not valid"
      interview
    end
  end

  def get_clue(store)
    if get_travel_options.size > 1 # Meaning, you're on the right track!
      gsc = current_game.game_store_clues.select { |gsc| gsc.store == store }[0]
      final_clue = gsc.clue.text
      #Logic to only sometimes grab a trait clue and append to clue string?
      current_index = current_game.neighborhoods.find_index(current_game.current_neighborhood)
      store_index = store.neighborhood.stores.find_index(store)

      # Grabs 30% of time based on neighborhoods index and 60% of the time based on store_index
      if (current_index % 2 == 0) && ((store_index % 2) == 0)
        traits = Suspect.column_names

        ##pick random trait, ignoring id and name column
        trait_clue = traits[rand(2..(traits.size - 1))]
        trait_value = current_game.suspect[trait_clue]
        trait_clue_normalized = trait_clue.gsub("_", " ")
        trait_clue_text = " It looked like their #{trait_clue_normalized} was #{trait_value}."
        final_clue = final_clue + trait_clue_text
      end
      final_clue
    else
      bad_clues = Clue.all.select { |c| c.neighborhood == nil }
      bad_clues[rand(0..2)].text
    end
  end

  def travel(options)
    puts
    puts "Where would you like to go?"
    puts
    if options.size > 1 ## Meaning, you're on the right track!
      options.each_with_index do |t, index|
        puts "#{index + 1}. #{t.name}"
      end
      puts "#{options.size + 1}. Go Back"
      puts
      response = gets.chomp
    else ## Meaning, you went the wrong way and need to go back
      puts "Hit any key to back to #{options[0].name}"
      STDIN.getch
      print "            \r"
      response = "1"
    end

    case response
    when "1"
      puts
      puts "You are now in #{options[0].name}!"
      puts
      current_game.neighborhood = options[0]
      current_game.current_neighborhood = options[0]
      ## If you've gone to the correct place, update the game's neighborhood variables
      if current_game.current_neighborhood == current_game.next_correct_neighborhood
        update_neighborhoods
      end
    when "2"
      puts
      puts "You are now in #{options[1].name}!"
      puts
      current_game.neighborhood = options[1]
      current_game.current_neighborhood = options[1]
      ## If you've gone to the correct place, update the game's neighborhood variables
      if current_game.current_neighborhood == current_game.next_correct_neighborhood
        update_neighborhoods
      end
    when "3"
      puts
      puts "You are now in #{options[2].name}!"
      puts
      current_game.neighborhood = options[2]
      current_game.current_neighborhood = options[2]
      ## If you've gone to the correct place, update the game's neighborhood variables
      if current_game.current_neighborhood == current_game.next_correct_neighborhood
        update_neighborhoods
      end
    when "4"
      puts
      puts "You are now in #{options[3]}.name!"
      puts
      current_game.neighborhood = options[3]
      current_game.current_neighborhood = options[3]
      ## If you've gone to the correct place, update the game's neighborhood variables
      if current_game.current_neighborhood == current_game.next_correct_neighborhood
        update_neighborhoods
      end
    when "5"
      player_menu
    else
      puts
      puts "That option is not valid"
      travel(get_travel_options)
    end

    player_menu
  end

  def update_neighborhoods
    index = current_game.neighborhoods.find_index(current_game.next_correct_neighborhood)
    current_game.last_correct_neighborhood = current_game.current_neighborhood
    current_game.next_correct_neighborhood = current_game.neighborhoods[index + 1]
  end

  def get_travel_options
    num_choices = 3

    # Is current_neighborhood correct? If so, stuff next correct neighborhood into options
    # Otherwise, stuff last_correct_neighborhood into travel options
    if current_game.current_neighborhood == current_game.last_correct_neighborhood
      travel_options = []
      #add next correct neighborhood
      travel_options << current_game.next_correct_neighborhood

      # Get 4 more options from Neighborhood.all that aren't in current_game.neighborhoods
      while num_choices > 0
        minus_current = Neighborhood.all.reject { |n| n == current_game.current_neighborhood }
        add_neighborhood = minus_current[rand(0..8)]
        if !(travel_options.include?(add_neighborhood))
          travel_options << add_neighborhood
          num_choices -= 1
        end
      end
    else
      travel_options = []
      #add last correct neighborhood
      travel_options << current_game.last_correct_neighborhood
    end
    travel_options.shuffle
  end

  def record_evidence
    puts
    puts "Welcome to your evidence book"
    puts
    puts "What would you like to do?"
    puts
    puts "1. Record Evidence"
    puts "2. See list of current suspects"
    puts "3. Go back"

    response = STDIN.gets.chomp

    case response
    when "1"
      evidence_recorder
    when "2"
      current_list_of_suspects
    when "3"
      player_menu
    else
      puts
      puts "That option is not valid"
      record_evidence
    end
  end

  def evidence_recorder
    puts
    puts "Which evidence would you like to record?"
    puts
    puts "1. Gender"
    puts "2. Hair Color"
    puts "3. Eye Color"
    puts "4. Vehicle"
    puts "5. Favorite Food"
    puts "6. Go back"
    response = STDIN.gets.chomp

    case response
    when "1"
      evidence_query("gender")
    when "2"
      evidence_query("hair_color")
    when "3"
      evidence_query("eye_color")
    when "4"
      evidence_query("vehicle")
    when "5"
      evidence_query("favorite_food")
    when "6"
      record_evidence
    else
      puts
      puts "That option is not valid"
      evidence_recorder
    end
  end

  def evidence_query(trait)
    puts
    puts "What is the suspect's #{trait.gsub(/_/, " ")}?"
    puts
    trait_options = Suspect.all.map {|s| s[trait]}.uniq
    trait_options.each_with_index {|t, i| puts "#{i + 1}. #{t.capitalize}"}
    clue_response = STDIN.gets.chomp
    guess = Evidence.find_or_create_by(game_id: current_game.id)
    if clue_response.to_i.to_s == clue_response && clue_response.to_i <= trait_options.length
      guess[trait] = trait_options[clue_response.to_i - 1]
      guess.save
      puts "Evidence Recorded"
      evidence_recorder
    else
      puts
      puts "That option is not valid"
      evidence_recorder
    end
  end

  def current_list_of_suspects
    active_suspects = Suspect.all
    game_suspect = Evidence.all.select {|s| s.game = current_game}
    suspect_hash = game_suspect.last.attributes.select {|k,v| v != nil}
    suspect_hash.delete("id")
    suspect_hash.delete("game_id")
    suspect_hash.each do |k,v|
      Suspect.all.each do |s|
        if s[k] != v
          active_suspects.delete(s)
        end
      end
    end
    puts
    puts "Here are the suspects that match your clues:"
    puts
    active_suspects.each_with_index {|s,i| puts "#{i + 1}. #{s.name}"}
    henchmen_details(active_suspects)
  end

  def henchmen_details(henchmen_array)
    puts
    puts "Would you like see details about each possible suspect?"
    puts
    puts "1. Look at suspect details"
    puts "2. Go back"
    response = gets.chomp
    case response
    when "1"
      puts
      puts "Which suspect would you like?"
      henchmen_array.each_with_index {|h,i| puts "#{i + 1}. #{h.name}"}
      detail_response = gets.chomp
      henchman = henchmen_array[detail_response.to_i - 1].attributes
      puts
      henchman.delete("id")
      henchman.each {|k,v| puts "#{k}: #{v}"}
      henchmen_details(henchmen_array)
    when "2"
      record_evidence
    else
      puts
      puts "That option is not valid"
      evidence_recorder
    end
  end

end
