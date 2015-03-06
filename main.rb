require "sinatra"
require "pry"
require "json"
require "sqlite3"

require_relative "database/database_setup.rb"
require_relative "models/slides_class.rb"

# Update all with '' because duh you don't need them with placeholders

#have window(onload) populate div with first slide info, then arrow buttons are some kind of loop? that point to next or previous item from array and populate div with it. 

get "/home" do
  @slides = (Slide.all).length
  erb :homepage
end

post "/slides" do
  slides = Slide.all
  
  slides_array = slides.map do |object|
     object.to_hash_all_info 
   end
  slides_array.to_json
end

post "/slide/:slide_order" do
  slide = Slide.find(params[:slide_order])
  
  slide_hash = slide.to_hash
  slide_hash.to_json
end