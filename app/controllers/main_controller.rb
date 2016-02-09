require './lib/string_segmenter'

# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

MyApp.get "/" do
  erb :"main/welcome"
end

MyApp.get "/segment/:text" do
  x = StringSegmenter.new(params[:text])
  x.run_program
  @words = x.final_words
end
