require_relative '../config/environment'
require_relative '../db/seeds.rb'
require 'pry'

c = Cli.new
c.welcome

Pry.start
