# require "sinatra"
require "pry"
require "json"
require "sqlite3"

require_relative "database/database_setup.rb"
require_relative "models/slides_class.rb"

binding.pry

# Update all with '' because duh you don't need them with placeholders
