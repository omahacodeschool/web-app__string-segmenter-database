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
  erb :"welcome"
end


# MyApp.get "/segment" do
# 	  input = Word.new
# 	  input.unsegmented = params["string_to_segment"]
# 	  x = StringSegmenter.new(params["string_to_segment"])
# 	  x.run_program
# 	  input.segmented = x.final_words
# 	  input.save
# 	  @result = input.segmented
#   erb :"result"
# end

MyApp.get "/segment" do
	if  Word.where(:unsegmented => params["string_to_segment"]).blank?
	  input = Word.new
	  input.unsegmented = params["string_to_segment"]
	  x = StringSegmenter.new(params["string_to_segment"])
	  x.run_program
	  input.segmented = x.final_words
	  input.save
	  @result = input.segmented
	else
		binding.pry
	   input = Word.where(:unsegmented => params["string_to_segment"]).take
	   @result = input.segmented
	 return @result
	end
  erb :"result"
end

MyApp.get "/admin" do
	@list_of_strings = Word.all
  erb :"admin"
end
