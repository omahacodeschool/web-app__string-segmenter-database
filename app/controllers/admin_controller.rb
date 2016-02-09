MyApp.get "/admin" do
  @searches = Search.all
  erb :"admin"
end