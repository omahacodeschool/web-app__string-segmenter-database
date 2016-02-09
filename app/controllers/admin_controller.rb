MyApp.get "/admin" do
  @searches = Search.all
  erb :"main/admin"
end