require "sinatra"
require "sinatra/reloader"
enable(:sessions)

require_relative "./lib/class.rb"


get "/" do
  if session[:logged]
    @username = session[:username]
    erb :home
  else
    erb :login
  end
end

get "/session_save/:text" do
  text = params[:text]
  session[:saved_value] = text
  "Now in the session: " + session[:saved_value]
end

get "/session_show" do
  "Session: " + session[:saved_value]
end

post "/login" do
  session[:username] = params[:name]
  session[:logged] = true

  redirect("/")
end

post "/logout" do
  session.clear

  redirect("/")
end
