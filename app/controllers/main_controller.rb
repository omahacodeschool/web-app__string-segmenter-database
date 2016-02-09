require_relative '../../lib/string_segmenter.rb'
require 'pry'
# Example of the StringSegmenter that is ALREADY included in this application:


# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  erb :"main/welcome"
end

MyApp.get "/searches"
  erb :"main/pastsearches"
end

#MyApp.get "/newstring" do
#  redirect to('/' + params[:input])
#end

MyApp.get "/:str" do
  str = params[:str]
  x = StringSegmenter.new(str)
  x.run_program
  @words = x.final_words

  @s = Search.new
  @s.inputstring = params[:str]
  @s.segmentstring = @words
  @s.save

  erb :"main/segmented"
end



