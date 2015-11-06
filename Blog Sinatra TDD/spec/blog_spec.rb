require_relative "../lib/blog.rb"
require_relative "../lib/post.rb"
require "rspec"

RSpec.describe "blog" do

  before :each do
    @my_blog = Blog.new
  end

  describe "posts" do
    it 'returns and array' do
      expect(@my_blog.posts).to be_a(Array)
    end
  end

  describe 'add_post' do
    it 'given anything returns the array of post' do
      expect(@my_blog.add_post("")).to be_a(Array)
    end

    it 'given a post returns the array of post including the given one' do
      post = Post.new("title", "date", "text")
      expect(@my_blog.add_post(post)).to contain_exactly(post)
    end
  end
end
