# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
# require_relative "../lib/dictionary"
# require_relative "../lib/string_segmenter"

MyApp.get "/" do
  erb :"homepage"
end

MyApp.get "/admin" do
  erb :"/a/admin"
end




MyApp.get "/segmenter" do
  
  @segment = StringSegmenter.new(params[:string])

  @i = Letter.new
  @i.search_string = params[:string]
  @i.segmented_parts = segmented_words_as_strings
  @i.save
  binding.pry
  
  erb :"/b/segmenter"

end