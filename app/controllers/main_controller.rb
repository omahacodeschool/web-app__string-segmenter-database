# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

# Show form.
MyApp.get "/" do
  erb :"homepage"
end

# Process form.
MyApp.get "/result" do
  # Use the StringSegmenter to get the final words array.
  x = StringSegmenter.new(params[:unsegmented_text])
  x.run_program
  segmented_arr = x.final_words # Returns an Array of the segmented words.
  segmented_words_as_string = segmented_arr.join(", ")

  # Use the ActiveRecord 'Search' class to access the database.
  @s = Search.new
  @s.search_string = params[:unsegmented_text]
  @s.segmented_parts = segmented_words_as_string
  @s.save

  erb :"result"
end