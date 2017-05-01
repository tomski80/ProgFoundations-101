
def bubble_sort!(array)
  new_index = array.size-1
  loop do
    index = 0
    last_swapable = new_index
    swap = false
    loop do
      if array[index] > array[index+1]
        array[index], array[index+1] = array[index+1], array[index]
        swap = true
        new_index = index
      end
      index += 1
      break if index >= last_swapable
    end
    break if swap == false
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
