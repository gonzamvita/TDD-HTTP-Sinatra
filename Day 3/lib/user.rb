class User
  def initialize(user, password)
    @user = user
    @password = password
    @info = {}
  end

  def add_user
    @info[@user] = @password
  end
end
