# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

MyApp.get "/" do
  erb :"/main"
end

MyApp.get "/admin" do
  @chains = Chain.all
  erb :"/admin"
end

MyApp.get "/segment" do
  x = StringSegmenter.new(params["string"])
  x.run_program
  @words = x.final_words # Returns an Array of the segmented words.
  y = Chain.new
  y.raw = params["string"]
  y.processed = @words
  y.save
  erb :"/segment"
end