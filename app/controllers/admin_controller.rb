MyApp.get "/admin" do
  @history = Input.all
  erb :"/main/Admin"
end