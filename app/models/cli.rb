class Cli

  def welcome
    puts "Welcome to Where in NYC is Carmen Sandiego!"
    p1 = find_or_create_player(player_name_getter)
    new_game = Game.create()
    p1.games << new_game
    new_game.generate_new_game_data
  end

  def player_name_getter
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
    puts "A horrible crime has occurred!!"
    puts "The suspect was seen leaving the bank and it's your job to track them down!"
    puts "You will have 24 hours to apprehend the criminal."
    puts
    player_menu
  end

  def player_menu
    puts "What would you like to do?"
    puts
    puts "1. Interview Witnesses"
    puts "2. Depart to Next Location"
    puts "3. Record Evidence"
    puts "4. End Game"
    puts
    response = gets.chomp

    case response
    when "1"
    when "2"
    when "3"
    when "4"
      exit
    else
      puts "Thats option is not valid"
      player_menu
    end
  end

  def interview
    puts "Which place would you like to visit?"
    puts
    puts "1. #{self.current_neighborhood.stores[0]}"
    puts "2. #{self.current_neighborhood.stores[1]}"
    puts "3. #{self.current_neighborhood.stores[2]}"
    puts "4. Go Back"
    puts
    response = gets.chomp

    case response
    when "1"
      puts "The #{self.current_neighborhood.stores[0].witness} says:"
      puts #get_clue(current_neighborhood.stores[0])
    when "2"
    when "3"
    when "4"
      player_menu
    else
      puts "Thats option is not valid"
      interview
    end
  end

  def get_clue(store)
    gsc = self.game_store_clues.select { |gsc| gsc.store == store }
    gsc[0].clue.text
  end
end
