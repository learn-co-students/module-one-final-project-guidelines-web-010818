tom = Player.create(name: 'Tom', rank: 'Rookie')

game = Game.create()

tom.games << game

tom.save
