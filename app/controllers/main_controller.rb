# Process form.
MyApp.get "/result" do
  # Use the StringSegmenter to get the final words array.
  x = StringSegmenter.new(params[:unsegmented_text])
  x.run_program
  segmented_arr = x.final_words # Returns an Array of the segmented words.
  segmented_words_as_string = segmented_arr.join(", ")

   #Use the ActiveRecord 'Search' class to access the database.
  @s = Search.new
  @s.unsegmented_text = params[:unsegmented_text]
  @s.words_segmented_out = segmented_words_as_string
  @s.save

  erb :"result"
end  

MyApp.get "/admin" do
#get list of strings
@searches = Search.all

erb :"admin"
end

# Show form.
MyApp.get "/" do
 
  erb :"homepage"

end