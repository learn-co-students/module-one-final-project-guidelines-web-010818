require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console => :environment do
  Pry.start
end

desc 'loads environment'
task :environment do
  require_relative 'config/environment'
end

desc 'seed database from db/seed.rb'
task :seed do
  ruby db/seed.rb
end
