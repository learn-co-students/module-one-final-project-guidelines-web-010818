require_relative '../config/environment'


session = Cli.new
session.find_genres_for_segment


current_user = Cli.new
current_user.find_genres_for_segment
