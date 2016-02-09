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


MyApp.get "/result" do
  x = StringSegmenter.new(params["string_to_segment"])
  x.run_program
  segmented_arr = x.final_words
  segmented_words_as_string = segmented_arr.join(", ")

  @s = Search.new
  @s.search_string = params["string_to_segment"]
  @s.segmented_parts = segmented_words_as_string
  @s.save

  erb :"main/result"
end