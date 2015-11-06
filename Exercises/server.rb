require "sinatra"
require "sinatra/reloader"
enable(:sessions)

require_relative "./lib/todolist.rb"


get "/" do
  if session[:logged]
    @username = session[:username]
    erb :todo
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

post "add_task" do
  content = params[:content]
  Task.new
  todo_list.add_task
  todo_list.save method
  redirect("/tasks")
end

post "/logout" do
  session.clear

  redirect("/")
end
