require_relative '../../lib/dictionary'

# directs to views/string_segmenter.erb. 
# @available_dictionary calls on available_dictionary() method in lib/dictionary.rb
MyApp.get "/string_segmenter" do
  @available_dictionary = available_dictionary()
  erb :"/string_segmenter"
end