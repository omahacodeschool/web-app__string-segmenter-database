# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------

MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  erb :"homepage"
end

#  MyApp.get "/:str" do
#    # @str = params[:str]
#    # @segment = StringSegmenter.new(@str)
#    erb :"main/str"
# end

MyApp.post "/str" do
  @str = params[:string]
  @segment = StringSegmenter.new(@str)
  
  erb :"main/str"

end