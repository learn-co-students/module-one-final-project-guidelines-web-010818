class Cli

  def welcome
    puts "Welcome to Where in NYC is Carmen Sandiego!"
    p1 = find_or_create_player(player_name_getter)
    p1.games << Game.create()
    p1.save
  end

  def player_name_getter
    puts "Please enter your name:"
    player_name = gets.chomp
  end

  # def find_game_instance(player)
  #   Game.all.find_by(player: player)
  # end

  def find_or_create_player(name)
    if Player.all.find {|p| p.name == name}
      Player.all.find {|p| p.name == name}
    else
      Player.create(name: name)
    end
  end

end
