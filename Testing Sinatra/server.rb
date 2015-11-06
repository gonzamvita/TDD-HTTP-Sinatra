require "sinatra"
require "sinatra/reloader"

get "/" do

end

get "/real_page" do

end

get "/hi" do
  redirect("/real_page")
end
