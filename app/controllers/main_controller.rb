require'./lib/string_segmenter'
# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

MyApp.get "/" do

  erb :"/welcome"
end

MyApp.get "/seg_view" do
  x = StringSegmenter.new(params[:seg_str])
  x.run_program
  @y = x.final_words.join(" ")
  erb :"/seg_view"
end

MyApp.get "/admin" do
  erb :"/admin"
end
