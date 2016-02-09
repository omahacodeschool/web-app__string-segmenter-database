require_relative '../../lib/string_segmenter'
require_relative '../../lib/dictionary'

# directs to views/string_segmenter.erb. 
# @available_dictionary calls on available_dictionary() method in lib/dictionary.rb
MyApp.get "/StringSegmenter/string_segmenter" do
  @available_dictionary = available_dictionary()
  erb :"/StringSegmenter/string_segmenter"
end

# posts form data from view/string_segmenter.erb to /user_input_string.erb
# @user_segmentation: instance of the Segment class in lib/string_segmenter.rb
## passes :user_input form data as an arguement via params. 
class MyApp

  get '/StringSegmenter/user_input_string' do
  history = Input.new
  history.original_string = params[:user_input]
  history.save
  @user_segmentation = Segment.new(params[:user_input])
  erb :"/StringSegmenter/user_input_string"
  end

end