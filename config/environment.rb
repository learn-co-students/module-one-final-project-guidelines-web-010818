require 'bundler'
require "json"
require "http"
require "optparse"
require "pry"
require "date"
require "command_line_reporter"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# turn off ActiveRecord Debug Logger for application
ActiveRecord::Base.logger = nil


# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app

# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 5

require_all 'lib'
