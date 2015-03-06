# Class: Slide
#
# Creates different slides for the slideshow.
#
# Attributes:
# @title       - String: Text of title
# @slide_order - Integer: Slide slide_order number
# @slide_text  - String: Slide body slide_text
# @id          - Integer: Primary key
#
# attr_reader :id
# attr_accessor :title, :slide_text, :slide_order
#
# Public Methods:
# #insert
# #save
# #self.find
# 
# Private Methods:
# #initialize

class Slide
  
  attr_reader :id, :errors
  attr_accessor :title, :slide_text, :slide_order


  # Private: initialize
  # Instantiates a new Slide object
  #
  # Parameters:
  # options - Hash
  #           - @title        - String: Text of title
  #           - @slide_order  - Integer: Slide slide_order number
  #           - @slide_text   - String: Slide body slide_text
  #           - @errors       - Hash: Any error messages go here
  #          
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @slide_text, @id, @title, @slide_order, @errors
                               
  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @slide_text = options["slide_text"]
    @slide_order = options["slide_order"]
    @errors = {"title"=>[], "slide_text"=>[], "slide_order"=>[]} #key would be "title", value would be array of error messages depending on specific error
    
    #create if-check to make sure slide_order # is unique.
  end
      
  # Public: insert
  # Inserts the information collected in initialize into the proper table
  #
  # Parameters:
  # None
  #
  # Returns:
  # The object's id number
  #
  # State Changes:
  # Sets @id instance variable  
  
  def insert
                    
    DATABASE.execute("INSERT INTO slides (title, slide_text, slide_order) VALUES   
                     (?, ?, ?)", @title, @slide_text, @slide_order)
                    
    @id = DATABASE.last_insert_row_id
  end
  # Public: save
  #
  # Inserts changes into the table record
  #
  # Parameters:
  # None
  #
  # Returns:
  # Empty array
  #
  # State Changes:
  # None
  
  def save      
    attributes = []
                                                                                 
    instance_variables.each do |i|                                               
      attributes << i.to_s.delete("@")                                           
    end     
                                                                         
                                                                                 
    query_hash = {}                                                 
                                                                                 
    attributes.each do |a|        #each with object                                               
      value = self.send(a)
      query_hash[a] = value                                                       
    end                                                                

    query_hash.each do |key, value|
      DATABASE.execute("UPDATE slides SET #{key} = ? WHERE id = #{@id}", value)
    end                                                                          
  end
  
  # Public: self.find
  # 
  # Grabs a specific record based on ID
  #
  # Parameters:
  # s_id - the record's ID
  #
  # Returns:
  # An object
  #
  # State Changes:
  # None  
  
  def self.find(s_id)
    result = DATABASE.execute("SELECT * FROM slides WHERE id = #{s_id}")[0]
    
    self.new(result)
  end
    
end