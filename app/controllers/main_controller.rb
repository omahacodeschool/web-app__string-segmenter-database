# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
require_relative "../../lib/string_segmenter"
require_relative "../../lib/dictionary"


MyApp.get "/admin" do

  erb :"main/admin"
end

MyApp.get "/segment" do
  x = StringSegmenter.new(params["string_to_segment"])
  x.run_program
  @result = x.final_words.join(", ")

  erb :"main/result"
end

MyApp.get "/" do
  
  erb :"main/welcome"
end

MyApp.get "/add_word"
  x = Segmenter.new
  x.words = params["string_to_segment"]
  x.save

  erb 
end