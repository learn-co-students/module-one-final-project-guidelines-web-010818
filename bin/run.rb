require_relative '../config/environment'

session = Cli.new
session.find_genres_for_segment
