require_relative '../config/environment'




current_user = Cli.new
current_user.get_events_from_venue
