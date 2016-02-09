require './lib/string_segmenter'

# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

# Show form
MyApp.get "/" do
  erb :"main/welcome"
end

# Process form
MyApp.get "/segment" do
  # Use the StringSegmenter to get the final words array
  x = StringSegmenter.new(params["string_to_segment"])
  x.run_program
  @words = x.final_words

  # Use the ActiveRecord 'Search' class to access the database
  @s = Search.new
  @s.search_string = params[:unsegmented_text]
  @s.segmented_parts = segmented_words_as_string
  @s.save

  erb :"main/result"
end
