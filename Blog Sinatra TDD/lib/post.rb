class Post
  attr_reader :title, :text, :date

  def initialize (title, date, text)
    @title = title
    @date = date
    @text = text
  end
end

# => @sponsoredTitle = "******#{title}******"
