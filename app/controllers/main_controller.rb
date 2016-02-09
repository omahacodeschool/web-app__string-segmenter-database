# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
require_relative "../../lib/string_segmenter"
require_relative "../../lib/dictionary"

MyApp.get "/" do
  
  erb :"main/welcome"
end


MyApp.get "/segment" do
  new_segmenter = StringSegmenter.new(params["string_to_segment"])
  new_segmenter.run_program
  result = new_segmenter.final_words.join(", ")

  @s = Search.new
  @s.search_string = params["string_to_segment"]
  @s.segmented_parts = result
  @result.save

  erb :"main/result"
end


MyApp.get "/add_word"
  x = Segmenter.new
  x.words = params["string_to_segment"]
  x.save

  erb :"main/admin"
end