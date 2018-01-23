require 'bundler'
require "json"
require "http"
require "optparse"
require "pry"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')


# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app
API_KEY = '4EBJY8ivWTcB1SRXIXZ1hQXqE14y4HqOYwpGTo1zgly-_oTa9wNahyobVvj3hM2Rv-3_vmMWon_QTun3WMSVZ4BQKkvz804kjC3eh51pKiIpWqEZQuhIn-TENVVmWnYx'


# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 5

require_all 'lib'
