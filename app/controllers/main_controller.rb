require './lib/string_segmenter'


# Your controller actions go below this line.
# -----------------------------------------------------------------------------

#gets the landing page
MyApp.get "/" do
  erb :"/welcome"
end

#takes sting from form and segments it. storing it in @y
MyApp.get "/seg_view" do
  x = StringSegmenter.new(params[:seg_str])
  x.run_program
  y = x.final_words
  z = y.join(" ")
  
  @s = SegmentedString.new
  @s.long_string = params[:seg_str]
  @s.seperated_string = z
  @s.save
  erb :"/seg_view"
end

#gets admin page
MyApp.get "/admin" do
  @words = SegmentedString.all
  erb :"/admin"
end


