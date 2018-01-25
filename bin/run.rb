require_relative '../config/environment'
require_relative '../db/seeds.rb'
require 'pry'

Cli.new.welcome

Pry.start
