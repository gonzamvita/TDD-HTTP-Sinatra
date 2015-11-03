require "sinatra"
require "Date"

get "/" do
  "My first Sinatra app."
end

get "/about" do
  "Learning Sinatra in Ironhack"
end

get "/author" do
  @greeting = "Hello World!!"
  @thetime = Time.now()
  @ingredients = ["cheese", "pepperoni", "mushrooms"]
  erb(:author)
end

get "/users/:username" do
  @username = params[:username]

  erb(:user_profile)
end
