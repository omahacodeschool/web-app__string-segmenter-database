MyApp.get "/admin" do
  @history = History.all
  erb :"/main/Admin"
end