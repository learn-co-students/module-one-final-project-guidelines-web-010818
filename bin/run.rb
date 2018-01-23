require_relative '../config/environment'
require_relative '../db/seed.rb'
require 'pry'

game = Game.create()

Pry.start
