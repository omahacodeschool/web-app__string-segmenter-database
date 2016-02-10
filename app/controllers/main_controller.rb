# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
# class String < ActiveRecord::Base
#   end
MyApp.get "/" do

  erb :"home"
end

MyApp.get "/page2" do
  x = StringSegmenter.new(params[:a])
  x.run_program
  ray = x.final_words
  result = ray.join(", ")

  @y = Apple.new
  @y.words = result
  @y.nospace = params[:a]
  @y.save
  erb :"allwords"
end

MyApp.get "/all_words" do
  @collection = Apple.all
  erb :"allwords"
end
