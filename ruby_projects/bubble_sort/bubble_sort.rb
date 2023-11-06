class BubbleSort

  def bubble_sort(array)
     swaps = nil
     len = array.length - 1

    begin
      swaps = 0
      1.upto(len) do | i|
        if array[i] < array[i-1] 
          array[i-1], array[i] = array[i], array[i-1]
          swaps +=1
        end
      end
      len -= 1
    end while swaps > 0
    array
  end
end

# test = BubbleSort.new
# pp test.bubble_sort([45])