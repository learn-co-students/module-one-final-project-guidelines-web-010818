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
      travel
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
    store1 = current_game.neighborhood.stores[0]
    store2 = current_game.neighborhood.stores[1]
    store3 = current_game.neighborhood.stores[2]

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
      puts "The #{store1.witness} says: \"#{get_clue(store1)}\""
      interview
    when "2"
      puts
      puts "The #{store2.witness} says: \"#{get_clue(store2)}\""
      interview
    when "3"
      puts
      puts "The #{store3.witness} says: \"#{get_clue(store3)}\""
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

  def travel
    puts
    puts "You are traveling!"
    puts
    player_menu
  end

  def record_evidence
    puts
    puts "Recording evidence...."
    puts
    player_menu
  end
end
