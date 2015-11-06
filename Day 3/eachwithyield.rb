class Array
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i+=1
    end
    self
  end

  def my_select
    my_new_array = []
    my_each do |i|
      if yield(i)
        my_new_array.push(i)
      end
    end
    my_new_array
  end

  def my_map
    return self unless block_given?
    my_new_array = []
    my_each {|i| my_new_array << yield(i) }
    my_new_array
  end

  def my_map_block(my_block)
    my_new_array = []
    my_each { |i| my_new_array << my_block.call(i) }
    my_new_array
  end
end

bloque = Proc.new {|item| item * 2}

# array = [1,2,3].my_map do |item|
#   item +=1
# end

# puts array
array = [1,2,3]
array2 = array.my_map_block(bloque)

puts array2
# [1,2,3].my_each { puts "hola" }

# [1,2,3].each_with_index do |item, index|
#   puts item
#   puts index
# end
