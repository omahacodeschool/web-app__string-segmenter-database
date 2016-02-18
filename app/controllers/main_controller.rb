# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
require_relative "../../lib/string_segmenter"

MyApp.get "/" do 

  erb :"main/homepage"

end

MyApp.get "/segment" do
  x = StringSegmenter.new(params["segment_string"])
  x.run_program
  @words = x.final_words

  y = SegmenterResult.new
  y.string_input = params["segment_string"]
  y.output_string = @words.join(", ")
  y.save


  erb :"main/segment_success"
end

MyApp.get "/admin" do
  
  @results = SegmenterResult.all

  erb :"main/admin"
end

