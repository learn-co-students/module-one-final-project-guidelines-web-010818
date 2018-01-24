require_relative '../config/environment'


current_user = Cli.new
current_user.find_events_for_attraction
