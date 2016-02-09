# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

require_relative "../../lib/string_segmenter"
require "pry"


MyApp.get "/" do
  erb :"main/welcome"
end

MyApp.post "/segment_page" do
  x = StringSegmenter.new
  x.run_program(params[:string])
  x.final_words
  erb :"main/segment_page"
end

MyApp.get "/admin" do
  erb :"main/admin"
end