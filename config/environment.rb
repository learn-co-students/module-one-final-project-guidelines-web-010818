require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
# require_relative "../app/models/clue"
# require_relative "../app/models/evidence"
# require_relative "../app/models/neighborhood"
# require_relative "../app/models/player"
# require_relative "../app/models/store"
# require_relative "../app/models/suspect"
# require_relative "../app/models/turn"
