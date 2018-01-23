require_relative '../config/environment'

puts "Search a Restaurant: "
term = gets.chomp
puts "Specify a location: "
location = gets.chomp

YelpApiAdapter.search(term, location)
