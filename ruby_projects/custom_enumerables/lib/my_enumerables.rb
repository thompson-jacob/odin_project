module Enumerable
  def my_all?
    self.my_each do |elem| 
     return false unless yield elem 
    end
    return true
  end

  def my_any?
    self.my_each do |elem|
      if yield elem
        return true
      end
    end
      return false
  end

  def my_count
    return self.size unless self.block_given? 
    count = 0
    self.my_each do |elem|
      count += 1 if yield elem
    end
    return count
  end

  def my_each_with_index 
    index = 0
    self.my_each do |elem|
      yield(elem, index)
     index += 1
    end
    
  end

  def my_inject(initial_value)
    self.my_each do |elem|
      initial_value = yield(elem, initial_value)
    end
    return initial_value
  end

   
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self # 'self' refers to the array instance
      yield element # 'yield' passes 'element' to the block
    end
  end
end
