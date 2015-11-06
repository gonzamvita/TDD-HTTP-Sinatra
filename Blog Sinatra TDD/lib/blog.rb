require 'Date'
require 'Pry'

class Blog
  attr_reader :allPosts

  def initialize
    @allPosts = []
  end

  def posts
    @allPosts
  end

  def add_post (post)
    @allPosts << post
  end

  def latest_posts
    @allPosts.sort { |a,b| b.date <=> a.date }
  end

  def get_post(id)
    @allPosts[id]
  end

  # def create_front_page
  #   @allPosts.sort! { |a,b| b.date <=> a.date }
  #   populateFrontPage
  #   @totalPages = @allPosts.length / @pageSize + 1
  # end

  # def populateFrontPage
  #   @frontPage = @allPosts[(@page-1)*@pageSize..(@page*@pageSize)-1]
  # end

  # def publish_front_page
  #   @frontPage.each do |post|
  #     puts ("#{post.title}\n**************\n#{post.text}\n----------------\n")
  #   end
  #   print_pagination
  # end

  # def print_pagination
  #   puts("")
  #   for i in 1..@totalPages do
  #     print("#{i}\s\s")
  #   end
  #     puts("\n\n> next")

  #   option = gets.chomp.to_s
  #   if option == "next" && @page < @totalPages
  #     @page += 1
  #     populateFrontPage
  #     publish_front_page
  #   elsif option == "prev" && @page > 1
  #     @page -=1
  #     populateFrontPage
  #     publish_front_page
  #   else
  #     return puts "ADIOS!!!!!!!!!!!!!!!!!!!!!!!"
  #   end
  # end
end

# class Post
#   attr_reader :title, :text, :date

#   def initialize (title, date, text)
#     @title = title
#     @date = date
#     @text = text
#   end
# end

# class SponsoredPost < Post
#   def initialize (title, date, text)
#     @sponsoredTitle = "******#{title}******"
#     super(@sponsoredTitle, date, text)
#   end
# end

# blog = Blog.new
# blog.add_post Post.new("Post title 1", DateTime.now(), "Post 1 text")
# blog.add_post SponsoredPost.new("Post title 2", DateTime.now(), "Post 2 text")
# blog.add_post Post.new("Post title 3", DateTime.now(), "Post 3 text")
# blog.add_post SponsoredPost.new("Post title 4", DateTime.now(), "Post 4 text")
# blog.add_post Post.new("Post title 5", DateTime.now(), "Post 5 text")
# blog.add_post Post.new("Post title 6", DateTime.now(), "Post 6 text")
# blog.add_post Post.new("Post title 7", DateTime.now(), "Post 7 text")
# blog.add_post SponsoredPost.new("Post title 8", DateTime.now(), "Post 8 text")

# blog.create_front_page
# blog.publish_front_page
