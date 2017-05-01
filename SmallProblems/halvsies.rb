# take 1 array
# return two array

def halvsies(array)
  half_size = array.size / 2 + (array.size % 2)
  [array[0..half_size-1],array[half_size..array.size-1]]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
