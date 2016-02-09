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
  erb :"homepage" #/This should go to the main page, where the input is.
end

#For adding a use of the string segmenter
MyApp.get "/result" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  x = StringSegmenter.new(params[:unsegmented_text])
  x.run_program 
  segmented_arr = x.final_words #array
  segmented_words_as_string = segmented.arr.join(", ")

  @s = Search.new
  @s.search_string = params[:unsegmented_text]
  @s.segmented_parts = segmented_words_as_string
  @s.save

  erb :"result"
end

