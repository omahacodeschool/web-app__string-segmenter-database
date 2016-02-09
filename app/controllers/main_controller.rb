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
  @letters = Letter.all
  erb :"/a/admin"
end




MyApp.get "/segmenter" do
  
  x = StringSegmenter.new(params[:string])
  x.run_program
  segmented_arr = x.final_words # Returns an Array of the segmented words.
  segmented_words_as_string = segmented_arr.join(", ")

  @i = Letter.new
  
  @i.input_string = params[:string]
  @i.output_words = segmented_words_as_string
  @i.save

  
  erb :"/b/segmenter"

end