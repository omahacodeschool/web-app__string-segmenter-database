require_relative "../../lib/string_segmenter"

MyApp.get "/admin" do
  @searches = Search.all
  erb :"main/admin"
end