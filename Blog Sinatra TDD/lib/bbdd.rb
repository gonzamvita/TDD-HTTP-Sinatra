class Memory
  def initialize

  end

  def save_number_in_file(number)
    IO.write("./public/memory.txt",number)
  end

  def get_number_from_file
    IO.read("./public/memory.txt")
  end
end
