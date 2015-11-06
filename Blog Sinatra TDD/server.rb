require "Date"
require "sinatra"
require "sinatra/reloader"
include Marshal

require_relative "./lib/blog.rb"
require_relative "./lib/post.rb"

get "/" do
  redirect("/blog")
end

get "/blog" do
  blog = Blog.new
  # blog.add_post Post.new("title1", Time.now, "text1")
  # blog.add_post Post.new("title2", Time.now, "text2")
  # blog.add_post Post.new("title3", Time.now, "text3")

  # => File.open('posts.marshal', 'w'){ |to_file| Marshal.dump(@allposts, to_file)}

  @allposts = File.open('posts.marshal', 'r'){ |from_file| Marshal.load(from_file)}
  erb :blog
end

get "/latest_posts" do
  blog = Blog.new
  # blog.add_post Post.new("title1", Time.now, "text1")
  # blog.add_post Post.new("title2", Time.now, "text2")
  # blog.add_post Post.new("title3", Time.now, "text3")
  @allposts = blog.latest_posts
  erb :blog
end

get "/post_detail/:index" do
  blog = Blog.new
  blog.add_post Post.new("title1", Time.now, "text1")
  blog.add_post Post.new("title2", Time.now, "text2")
  blog.add_post Post.new("title3", Time.now, "text3")
  @allposts = blog.latest_posts
  @post = blog.get_post(params[:index].to_i)
  erb :post_detail
end
